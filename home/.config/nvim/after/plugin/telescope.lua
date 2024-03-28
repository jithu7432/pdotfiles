local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-p>", function()
    builtin.git_files({})
end, {})

vim.keymap.set('n', '<leader>ps',
    function()
        builtin.grep_string({ search = vim.fn.input("Rg> ") });
    end, {})

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
    }
}
