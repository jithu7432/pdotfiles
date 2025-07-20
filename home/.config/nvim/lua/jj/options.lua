vim.opt.autoindent    = true
vim.opt.autoread      = true
vim.opt.backup        = false
vim.opt.clipboard     = 'unnamedplus'
vim.opt.cmdheight     = 1
vim.opt.encoding      = 'utf-8'
vim.opt.errorbells    = false
vim.opt.expandtab     = true
vim.opt.guicursor     = ''
vim.opt.hidden        = true
vim.opt.hlsearch      = false
vim.opt.ignorecase    = true
vim.opt.incsearch     = true
vim.opt.number        = true
vim.opt.rnu           = true
vim.opt.scrolloff     = 3
vim.opt.shiftwidth    = 4
vim.opt.showmode      = false
vim.opt.signcolumn    = 'yes'
vim.opt.smartcase     = true
vim.opt.smartindent   = true
vim.opt.softtabstop   = 4
vim.opt.swapfile      = false
vim.opt.syntax        = 'enable'
vim.opt.tabstop       = 4
vim.opt.termguicolors = true
vim.opt.updatetime    = 50
vim.opt.wrap          = false
vim.opt.colorcolumn   = "150"

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 250 })
    end,
})

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0


vim.filetype.add({
    extension = {
        wixproj = 'xml', xaml = 'xml', props = 'xml', wxs = 'xml'
    }
})
