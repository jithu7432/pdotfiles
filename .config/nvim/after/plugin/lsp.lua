-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end


local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set("n", "gp", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "gn", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
vim.keymap.set({"x", "n"}, "<leader>f", "<Plug>(coc-format)", {silent = true})

-- Apply codeAction to the selected region
local opts = {silent = true, nowait = true}
vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Mappings for CoCList
local opts = {silent = true, nowait = true}
vim.keymap.set("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
vim.keymap.set("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
vim.keymap.set("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
vim.keymap.set("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
vim.keymap.set("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
vim.keymap.set("n", "<space>j", ":<C-u>CocNext<cr>", opts)
vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
vim.keymap.set("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

