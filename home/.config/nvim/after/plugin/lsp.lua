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
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                -- lint
                flake8 = { enabled = false, ignore = { 'E501' } },
                -- lsp
                pylint = { enabled = true, ignore = { 'C0411', 'C0115', 'C0116' } },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                -- analzyer
                mccabe = { enabled = true },
                -- format
                autopep8 = { enabled = true }
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
