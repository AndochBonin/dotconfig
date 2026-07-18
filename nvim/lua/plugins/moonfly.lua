return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000, -- make sure it loads before other UI plugins
    config = function()
        -- Optional settings before loading the colorscheme
        vim.g.moonflyTransparent = false -- true for transparent background
        vim.g.moonflyItalics = true
        vim.g.moonflyNormalFloat = true

        require("moonfly").custom_colors({
            bg = "#000000",
            white = "#e0e0e0",
            sky = "#8ac8ff",
            khaki = "#d8de8a",
            violet = "#dda0f5",
            emerald = "#42ddb0",
            turquoise = "#88e8d6",
            green = "#a0e070",
            orange = "#f0a868",
            cranberry = "#ff7088",
            purple = "#b898ff",
            lavender = "#b8b8ff",
            orchid = "#f0a0b0",
        })
        vim.cmd("colorscheme moonfly")

        local function set_lsp_float_hl()
            vim.api.nvim_set_hl(0, "LspFloat", { bg = "#000000", fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "LspFloatBorder", { bg = "#000000", fg = "#1c1c1c" })
        end

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = set_lsp_float_hl,
        })
        set_lsp_float_hl()
    end,
}
