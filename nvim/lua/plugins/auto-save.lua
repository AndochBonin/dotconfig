return {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
        enabled = true,
        debounce_delay = 1500,
        trigger_events = {
            immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
            defer_save = { "InsertLeave", "TextChanged", "TextChangedI" },
            cancel_deferred_save = { "InsertEnter" },
        },
        condition = function(buf)
            if vim.b[buf].external_change_pending then
                return false
            end
            if vim.bo[buf].buftype ~= "" then
                return false
            end
            if vim.bo[buf].readonly then
                return false
            end
            if vim.api.nvim_buf_get_name(buf) == "" then
                return false
            end
            return true
        end,
    },
}
