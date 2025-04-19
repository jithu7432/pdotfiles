local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'airblade/vim-rooter' },
    { 'gruvbox-community/gruvbox' },
    { 'jiangmiao/auto-pairs' },
    { 'junegunn/vim-easy-align' },
    { 'justinmk/vim-sneak' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'neovim/nvim-lspconfig' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    { 'preservim/nerdcommenter' },
    { 'rust-lang/rust.vim' },
    { 'terryma/vim-multiple-cursors' },
    { 'tpope/vim-fugitive' },
    { 'vim-airline/vim-airline' },
    { 'windwp/nvim-autopairs' },
    { 'windwp/nvim-ts-autotag' },
    { 'nvimtools/none-ls.nvim' },
    { 'NStefan002/screenkey.nvim' },
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = {}
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'super-tab' },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = { documentation = { auto_show = false } },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "rust" }
        },
        opts_extend = { "sources.default" }
    }
}

require("lazy").setup(plugins, {})
