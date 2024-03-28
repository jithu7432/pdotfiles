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
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = false,
    analyze_open_documents_only = false,
})

lsp.rust_analyzer.setup({
    capabilities = capabilities,
})

lsp.jsonls.setup({
    capabilities = capabilities,
})
