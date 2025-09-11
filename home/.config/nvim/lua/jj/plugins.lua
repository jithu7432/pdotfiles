local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end

vim.opt.rtp:prepend(lazypath)


local plugins = {
    { 'airblade/vim-rooter' },
    { 'sainnhe/gruvbox-material' },
    { 'jiangmiao/auto-pairs' },
    { 'junegunn/vim-easy-align' },
    { 'justinmk/vim-sneak' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-telescope/telescope.nvim',      dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim", } },
    { 'nvim-treesitter/nvim-treesitter',    build = ':TSUpdate' },
    { 'nvimtools/none-ls.nvim' },
    { 'preservim/nerdcommenter' },
    { 'terryma/vim-multiple-cursors' },
    { 'tpope/vim-fugitive' },
    { 'vim-airline/vim-airline',            dependencies = { 'vim-airline/vim-airline-themes' } },

    { 'windwp/nvim-autopairs' },
    { 'windwp/nvim-ts-autotag' },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'super-tab' },
            appearance = { nerd_font_variant = 'mono' },
            completion = { documentation = { auto_show = false } },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
            fuzzy = { implementation = "rust" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}

require("lazy").setup(plugins, {})
