local M = {}

local group = vim.api.nvim_create_augroup("file-sync", { clear = true })

function M.setup()
    vim.opt.autoread = true

    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
        desc = "Check for external file changes on focus or buffer enter",
        group = group,
        command = "checktime",
    })

    vim.fn.timer_start(500, function()
        vim.cmd("checktime")
    end, { ["repeat"] = -1 })

    vim.api.nvim_create_autocmd("FileChangedShellPost", {
        desc = "Restore cursor after autoread reload",
        group = group,
        callback = function()
            local pos = vim.api.nvim_win_get_cursor(0)
            vim.cmd("checktime")
            pcall(vim.api.nvim_win_set_cursor, 0, pos)
        end,
    })

    vim.api.nvim_create_autocmd("FileChangedShell", {
        desc = "Pause auto-save when external change conflicts with dirty buffer",
        group = group,
        callback = function(args)
            if vim.bo[args.buf].modified then
                vim.b[args.buf].external_change_pending = true
                vim.notify(
                    vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":t")
                        .. " changed on disk. Use <leader>fr to reload or <leader>fs to keep yours.",
                    vim.log.levels.WARN
                )
            end
        end,
    })

    vim.keymap.set("n", "<leader>fr", function()
        local buf = vim.api.nvim_get_current_buf()
        vim.b[buf].external_change_pending = nil
        vim.cmd("e!")
    end, { desc = "Reload buffer from disk" })

    vim.keymap.set("n", "<leader>fs", function()
        local buf = vim.api.nvim_get_current_buf()
        vim.b[buf].external_change_pending = nil
        vim.cmd("write")
    end, { desc = "Force-save buffer over disk" })
end

M.setup()

return M
