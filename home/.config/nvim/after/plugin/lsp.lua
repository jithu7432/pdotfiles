local capabilities = require('cmp_nvim_lsp')
    .default_capabilities()

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
    settings = {
        pylsp = {
            plugins = {
                flake8 = { enabled = true },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
                mccabe = { enabled = false },
            },
        },
    },
})



lsp.omnisharp
    .setup({
        capabilities = capabilities,
        cmd = { 'omnisharp', '-lsp' },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        sdk_include_prereleases = false,
        analyze_open_documents_only = false,
    })

lsp.ts_ls
    .setup {}


lsp.taplo
    .setup {}
