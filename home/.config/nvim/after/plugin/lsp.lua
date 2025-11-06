vim.lsp.enable('clangd')
vim.lsp.enable('digestif')
vim.lsp.enable('gopls')
vim.lsp.enable('gradle_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lemminx')
vim.lsp.enable('lua_ls')
vim.lsp.enable('neocmake')
vim.lsp.enable('zuban')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('taplo')
vim.lsp.enable('ts_ls')
vim.lsp.enable('kotlin_lsp');
vim.lsp.enable('roslyn_ls');

if vim.fn.has 'win32' ~= 1 then
    vim.lsp.enable('bashls')
end
