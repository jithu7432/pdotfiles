function SetColorScheme(color)
    color = color or "gruvbox-material";

    vim.g.gruvbox_material_foreground = "mix";
    vim.g.gruvbox_material_background = "medium";
    vim.g.gruvbox_material_better_performance = 1;
    vim.g.gruvbox_material_transparent_background = 2

    vim.cmd.colorscheme(color);

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });
end

SetColorScheme();
