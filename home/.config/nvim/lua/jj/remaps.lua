vim.g.mapleader = "\\"

local function compile_or_make()
    if vim.fn.exists(':Compile') == 2 then
        vim.cmd('Compile')
    else
        vim.cmd('make')
    end
end

vim.keymap.set("n", "<leader><leader>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>c", compile_or_make)
vim.keymap.set("n", "gT", vim.cmd.bp)
vim.keymap.set("n", "gt", vim.cmd.bn)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ mode = "n", noremap = true }, "<S-Tab>", "<<")
vim.keymap.set({ mode = "i", noremap = true }, "<S-Tab>", "C-d")
