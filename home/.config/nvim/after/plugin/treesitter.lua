local treesitter = require("nvim-treesitter")
treesitter.setup({ install_dir = vim.fn.stdpath("data") .. "/site" })

vim.api.nvim_create_autocmd("PackChanged", {
	desc = "update tree-sitter parsers",
	callback = function(args)
		if args.data.spec.name == "nvim-treesitter" and args.data.kind == "update" then
			vim.cmd("TSUpdate")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
	pattern = "*",
	callback = function()
		local ret, err = pcall(function()
			vim.treesitter.start()
		end)
		if ret then
			pcall(function()
				vim.treesitter.start()
			end)
		end
	end,
})
