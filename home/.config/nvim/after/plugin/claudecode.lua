-- require("claudecode").setup({
-- 	diff_opts = {
-- 		layout = "vertical",
-- 	},
-- })
--
-- vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
-- vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
-- vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
-- vim.keymap.set("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
-- vim.keymap.set("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
-- vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
-- vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
-- Diff management
-- vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
-- vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

require("sidekick").setup({
	cli = {
		mux = {
			enabled = false,
		},
		tools = {
			cursor = {},
			claude = {},
		},
	},
})
local cli = require("sidekick.cli")

vim.keymap.set("n", "<leader>ac", function()
	cli.toggle({ name = "cursor", focus = true })
end, {
	desc = "Sidekick Toggle",
})

-- Auto-attach @file / @file:Lrange when focusing Sidekick (claudecode-style).
local Loc = require("sidekick.cli.context.location")
local Text = require("sidekick.text")

local group = vim.api.nvim_create_augroup("SidekickAutoContext", { clear = true })
local held_range ---@type sidekick.context.Range|nil
local held_buf ---@type integer|nil
local flush_pos ---@type { buf: integer, row: integer, col: integer }|nil
local snap ---@type { buf: integer, cwd: string, row: integer, col: integer, range?: sidekick.context.Range }|nil
local last_sent ---@type string|nil

local function visual_kind(mode)
	if mode == "V" then
		return "line"
	elseif mode == "\22" then
		return "block"
	elseif mode == "v" then
		return "char"
	end
end

---@param buf integer
---@return sidekick.context.Range|nil
local function range_from_marks(buf)
	local kind = visual_kind(vim.fn.visualmode())
	if not kind then
		return nil
	end
	local from = vim.api.nvim_buf_get_mark(buf, "<")
	local to = vim.api.nvim_buf_get_mark(buf, ">")
	if from[1] == 0 or to[1] == 0 then
		return nil
	end
	if from[1] > to[1] or (from[1] == to[1] and from[2] > to[2]) then
		from, to = to, from
	end
	return {
		from = { from[1], from[2] },
		to = { to[1], to[2] },
		kind = kind,
	}
end

---@return string|nil
local function buffer_diff(buf, cwd)
	local name = vim.api.nvim_buf_get_name(buf)
	if name == "" then
		return nil
	end

	if vim.bo[buf].modified then
		local ok, disk = pcall(vim.fn.readfile, name)
		if not ok then
			return nil
		end
		local a = table.concat(disk, "\n") .. "\n"
		local b = table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), "\n") .. "\n"
		local diff = vim.diff(a, b, { ctxlen = 3 })
		return (diff and diff ~= "") and diff or nil
	end

	local out = vim.fn.system({ "git", "-C", cwd, "diff", "--", name })
	if vim.v.shell_error == 0 and out ~= "" then
		return out
	end
end

---@param mention sidekick.Text[]
---@param diff? string
---@return sidekick.Text[]
local function with_diff(mention, diff)
	if not diff or diff == "" then
		return mention
	end
	local out = vim.deepcopy(mention)
	out[#out + 1] = { { "" } }
	out[#out + 1] = { { "```diff" } }
	for _, line in ipairs(vim.split(diff, "\n", { plain = true })) do
		out[#out + 1] = { { line } }
	end
	out[#out + 1] = { { "```" } }
	return out
end

---@param text sidekick.Text[]
---@param name? string
local function send_context(text, name)
	local key = Text.to_string(text)
	if key == "" or key == last_sent then
		return
	end
	last_sent = key
	vim.schedule(function()
		cli.send({
			text = text,
			name = name,
			focus = false,
		})
	end)
end

-- Hold visual selection until the cursor moves, so <C-w>l can still attach it.
vim.api.nvim_create_autocmd("ModeChanged", {
	group = group,
	callback = function()
		local old, new = vim.v.event.old_mode, vim.v.event.new_mode
		if not visual_kind(old) or visual_kind(new) then
			return
		end
		local buf = vim.api.nvim_get_current_buf()
		if not Loc.is_file(buf) then
			return
		end
		held_range = range_from_marks(buf)
		held_buf = buf
		local cursor = vim.api.nvim_win_get_cursor(0)
		flush_pos = { buf = buf, row = cursor[1], col = cursor[2] }
	end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	group = group,
	callback = function()
		if not flush_pos or vim.api.nvim_get_current_buf() ~= flush_pos.buf then
			return
		end
		local cursor = vim.api.nvim_win_get_cursor(0)
		if cursor[1] ~= flush_pos.row or cursor[2] ~= flush_pos.col then
			held_range, held_buf, flush_pos = nil, nil, nil
		end
	end,
})

vim.api.nvim_create_autocmd("WinLeave", {
	group = group,
	callback = function()
		local win = vim.api.nvim_get_current_win()
		local buf = vim.api.nvim_win_get_buf(win)
		if not Loc.is_file(buf) then
			return
		end
		local cursor = vim.api.nvim_win_get_cursor(win)
		local range = visual_kind(vim.fn.mode()) and range_from_marks(buf) or nil
		if not range and held_buf == buf then
			range = held_range
		end
		snap = {
			buf = buf,
			cwd = vim.fs.normalize(vim.fn.getcwd(win)),
			row = cursor[1],
			col = cursor[2] + 1,
			range = range,
		}
	end,
})

vim.api.nvim_create_autocmd("WinEnter", {
	group = group,
	callback = function()
		if vim.bo.filetype ~= "sidekick_terminal" or not snap then
			return
		end
		if not vim.api.nvim_buf_is_valid(snap.buf) then
			snap = nil
			return
		end

		local s = snap
		snap = nil

		local mention = Loc.get({
			buf = s.buf,
			cwd = s.cwd,
			row = s.row,
			col = s.col,
			range = s.range,
		}, { kind = s.range and "line" or "file" })
		if not mention or not mention[1] then
			return
		end

		local tool = vim.b.sidekick_cli
		local name = tool and tool.name or nil
		local diff = buffer_diff(s.buf, s.cwd)

		if not diff then
			send_context(mention, name)
			return
		end

		vim.schedule(function()
			local choice = vim.fn.confirm("Include diff for edited file?", "&Yes\n&File only\n&Cancel", 1, "Question")
			if choice == 0 or choice == 3 then
				return
			end
			send_context(choice == 1 and bundled or mention, name)
		end)
	end,
})
