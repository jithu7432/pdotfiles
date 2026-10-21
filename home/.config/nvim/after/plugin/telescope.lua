local telescope = require("telescope")
telescope.setup({
	defaults = {
		file_ignore_patterns = { ".git", "node_modules" },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
})
telescope.load_extension("live_grep_args")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", function()
	local ok, _ = pcall(builtin.git_files, {})
	if not ok then
		builtin.find_files({})
	end
end, {})

local function ext_filter(prompt)
	local pat, exts = prompt:match("^(.-)  +(.+)$")
	if not pat or pat == "" then
		return { prompt = prompt }
	end
	local out = '"' .. pat:gsub('"', '\\"') .. '"'
	for ext in exts:gmatch("%S+") do
		out = out .. ' -g "*.' .. ext:gsub("^%.", "") .. '"'
	end
	return { prompt = out }
end

vim.keymap.set("n", "<leader>ps", function()
	telescope.extensions.live_grep_args.live_grep_args({ on_input_filter_cb = ext_filter })
end, {})
