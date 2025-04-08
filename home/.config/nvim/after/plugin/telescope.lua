local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-p>",
    function()
        local ok, _ = pcall(builtin.git_files, {})
        if not ok then
            builtin.find_files({})
        end
    end,
    {})

vim.keymap.set('n', '<leader>ps', function() builtin.live_grep({}) end, {})

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
