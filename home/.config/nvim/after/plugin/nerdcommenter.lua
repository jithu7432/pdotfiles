vim.g["NERDCreateDefaultMappings"]  = 1
vim.g["NERDSpaceDelims"]            = 1
vim.g["NERDCompactSexyComs"]        = 1
vim.g["NERDDefaultAlign"]           = 'left'
vim.g["NERDCommentEmptyLines"]      = 1
vim.g["NERDTrimTrailingWhitespace"] = 1
vim.g["NERDToggleCheckAllLines"]    = 1

vim.keymap.set({ "n", "v" }, "<C-/>", "<Plug>NERDCommenterToggle")
vim.keymap.set({ "n", "v" }, "<C-_>", "<Plug>NERDCommenterToggle")

vim.keymap.set({ "n", "v" }, ",omg", "<Plug>NERDCommenterComment")
