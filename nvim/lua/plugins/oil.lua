return {
    {
        "stevearc/oil.nvim",
        opts = {
            view_options = {
                show_hidden = true,
            },

            float = {
                max_width = 0.6,
                max_height = 0.8,
                border = "rounded",
                win_options = {
                    winhl = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder",
                },
            },
            keymaps = {
                ["<Esc>"] = "actions.close",
            },
        },

        dependencies = {
            { "nvim-mini/mini.icons",   opts = {} },
            { "echasnovski/mini.icons", opts = {} },
            {
                "malewicz1337/oil-git.nvim",
                dependencies = { "stevearc/oil.nvim" },
                opts = {
                    show_file_highlights = true,
                    show_directory_highlights = false,
                    show_ignored_files = true,
                },
            },
        },

        lazy = false,

        keys = {
            {
                "<leader>-",
                function()
                    require("oil").open_float()
                end,
                desc = "Open Oil in floating window",
            },
        },
    },
}
