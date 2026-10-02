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

local group = vim.api.nvim_create_augroup("TerminalCursorTracker", { clear = true })
local scounter = 0
local pcounter = 0

vim.api.nvim_create_autocmd("ModeChanged", {
	group = group,
	callback = function()
		scounter = scounter + 1
	end,
})

vim.api.nvim_create_autocmd("TermEnter", {
	group = group,
	callback = function()
		if pcounter ~= scounter then
			pcounter = scounter
			cli.send({ name = "cursor", msg = "{line}", focus = true })
		end
	end,
})
