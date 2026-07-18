return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    -- build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()
        require("nvim-treesitter").install({ "go" })
    end,
}
