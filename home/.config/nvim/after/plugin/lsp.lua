local capabilities = require('cmp_nvim_lsp')
    .default_capabilities()

local lsp = require('lspconfig')
lsp.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lsp.pyright.setup {
    capabilities = capabilities
}

lsp.omnisharp.setup({
    capabilities = capabilities,
    cmd = { 'omnisharp', '-lsp' },
})
