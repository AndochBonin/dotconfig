return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000, -- make sure it loads before other UI plugins
    config = function()
        -- Optional settings before loading the colorscheme
        vim.g.moonflyTransparent = false  -- true for transparent background
        vim.g.moonflyItalics = true
        vim.g.moonflyNormalFloat = true

        vim.cmd("colorscheme moonfly")
    end
}

