local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require('lspconfig')

lsp.digestif
    .setup({})

lsp.rust_analyzer
    .setup({
        capabilities = capabilities,
    })

lsp.jsonls
    .setup({
        capabilities = capabilities,
    })

lsp.lua_ls
    .setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    }

lsp.pylsp.setup({
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pylint = { enabled = true, ignore = { 'C0411', 'C0115', 'C0116', 'C103', 'C116' } },
                autopep8 = { enabled = true }
            },
        },
    },
})

lsp.ts_ls
    .setup({
        capabilities = capabilities
    })

lsp.taplo
    .setup({
        capabilities = capabilities
    })

lsp.gradle_ls
    .setup({
        capabilities = capabilities
    })


lsp.cssls
    .setup({
        capabilities = capabilities
    })

lsp.gopls
    .setup({
        capabilities = capabilities
    })

lsp.clangd
    .setup({
        capabilities = capabilities
    })

lsp.lemminx
    .setup({
        capabilities = capabilities
    })

