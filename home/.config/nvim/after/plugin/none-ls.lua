local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.completion.spell,
        -- require("none-ls.formatting.trim_newlines"),
        -- require("none-ls.formatting.trim_whitespace"),
        require("none-ls.formatting.autopep8"),
        require("none-ls.formatting.jq"),
        require("none-ls.formatting.taplo"),
        require("none-ls.formatting.tex_fmt"),
    },
})

