require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "python", "rust", "javascript", "typescript", "c", "json", "yaml", "toml" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
