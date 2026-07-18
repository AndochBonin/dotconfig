return {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 1000,
    config = function()
        require("notify").setup({
            stages = "static",
            timeout = 3000,
            border = "single",
            background_colour = "#000000",
            render = "wrapped-default",
            top_down = true,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { border = "single" })
            end,
        })

        vim.notify = require("notify")
    end,
}
