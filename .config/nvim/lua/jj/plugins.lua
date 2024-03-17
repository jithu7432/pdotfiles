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
    { 'neoclide/coc.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'neovim/nvim-lspconfig' },
    { 'nvim-telescope/telescope.nvim',      tag = '0.1.5',      dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-treesitter/nvim-treesitter',    build = ':TSUpdate' },
    { 'preservim/nerdcommenter' },
    { 'rust-lang/rust.vim' },
    { 'terryma/vim-multiple-cursors' },
    { 'tpope/vim-fugitive' },
    { 'vim-airline/vim-airline' },

}

require("lazy").setup(plugins, {})
