vim.lsp.enable('clangd')
vim.lsp.enable('digestif')
vim.lsp.enable('gopls')
vim.lsp.enable('gradle_ls')
vim.lsp.enable('lemminx')
vim.lsp.enable('stylua')
vim.lsp.enable('neocmake')
vim.lsp.enable('zuban')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('taplo')
vim.lsp.enable('tsgo')
vim.lsp.enable('eslint')
vim.lsp.enable('kotlin_lsp')
vim.lsp.enable('roslyn_ls')
vim.lsp.enable('yamlls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('html')
vim.lsp.enable('nginx_language_server')
vim.lsp.config['astro'] = {
      init_options = {
        typescript = {
          tsdk = '/usr/lib/node_modules/typescript/lib',
        },
      },
    }
	init_options = {
		typescript = {
			tsdk = "/usr/lib/node_modules/typescript/lib",
		},
	},
vim.lsp.enable("astro")

if vim.fn.has('win32') ~= 1 then
	vim.lsp.enable('bashls')
end

vim.lsp.config('jsonls', {
	init_options = {
		provideFormatter = false,
	},
})
vim.lsp.enable('jsonls')
