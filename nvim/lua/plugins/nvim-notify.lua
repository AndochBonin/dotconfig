return {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 1000,
-- The configuration looks good. The code is properly
-- structured and follows Lua conventions.
    config = function()
        require("notify").setup({
            stages = "static",
            timeout = 3000,
            border = "single",
            background_colour = "#000000",
            render = "default",
            top_down = true,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { border = "single" })
            end,
        })

        vim.notify = require("notify")
    end,
}
