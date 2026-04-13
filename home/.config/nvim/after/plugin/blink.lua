require("blink.cmp").setup({
	enabled = function()
		return not vim.bo.filetype:match("^dap")
	end,
	keymap = { preset = "super-tab" },
	appearance = { nerd_font_variant = "mono" },
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "buffer" },
	},
	fuzzy = {
		implementation = "rust",
	},
})
