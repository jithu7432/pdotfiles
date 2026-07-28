require("blink.cmp").setup({
	enabled = function()
		return not vim.bo.filetype:match("^dap")
	end,
	keymap = { preset = "super-tab" },
	appearance = { nerd_font_variant = "mono" },
	completion = { documentation = { auto_show = false } },
	sources = {
		default = { "lsp", "path", "buffer" },
		per_filetype = {
			sql = { "dadbod", "buffer" },
		},
		providers = {
			dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
		},
	},
	fuzzy = {
		implementation = "rust",
	},
})
