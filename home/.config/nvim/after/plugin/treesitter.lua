require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "toml",
        "typescript",
        "vim",
        "yaml"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}
