-- local plugins = {
--     {
--         'saghen/blink.cmp',
--         dependencies = { 'rafamadriz/friendly-snippets' },
--         version = '1.*',
--         ---@module 'blink.cmp'
--         ---@type blink.cmp.Config
--         opts = {
--             keymap = { preset = 'super-tab' },
--             appearance = { nerd_font_variant = 'mono' },
--             completion = { documentation = { auto_show = false } },
--             sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
--             fuzzy = { implementation = "rust" }
--         },
--         opts_extend = { "sources.default" }
--     },
--     {
--         "folke/lazydev.nvim",
--         ft = "lua", -- only load on lua files
--         opts = {
--             library = {
--                 -- See the configuration section for more details
--                 -- Load luvit types when the `vim.uv` word is found
--                 { path = "${3rd}/luv/library", words = { "vim%.uv" } },
--             },
--         },
--     },
-- }
--
-- require("lazy").setup(plugins, {})

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
	{ src = "https://github.com/airblade/vim-rooter" },
	{ src = "https://github.com/jiangmiao/auto-pairs" },
	{ src = "https://github.com/junegunn/vim-easy-align" },
	{ src = "https://github.com/justinmk/vim-sneak" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/sainnhe/gruvbox-material" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvimtools/none-ls-extras.nvim" },
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	-- { src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/preservim/nerdcommenter" },
	{ src = "https://github.com/terryma/vim-multiple-cursors" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/saghen/blink.cmp" },
})
