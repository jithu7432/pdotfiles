local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'L3MON4D3/LuaSnip' },
    { 'airblade/vim-rooter' },
    { 'gruvbox-community/gruvbox' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/nvim-cmp' },
    { 'jiangmiao/auto-pairs' },
    { 'junegunn/vim-easy-align' },
    { 'justinmk/vim-sneak' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-telescope/telescope.nvim',      dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-treesitter/nvim-treesitter',    build = ':TSUpdate' },
    { 'preservim/nerdcommenter' },
    { 'rust-lang/rust.vim' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'terryma/vim-multiple-cursors' },
    { 'tpope/vim-fugitive' },
    { 'vim-airline/vim-airline' },
    { 'windwp/nvim-autopairs' },
    { 'nvimtools/none-ls.nvim' }
}

require("lazy").setup(plugins, {})
