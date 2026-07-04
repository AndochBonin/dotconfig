local M = {}

local function center_in(outer, inner)
    return (outer - inner) / 2
end

local function win_config()
    local width_mult = 0.8
    local height_mult = 0.6
    local width = math.floor(vim.o.columns * width_mult)
    local height = math.floor(vim.o.lines * height_mult)
    return {
        relative = "editor",
        width = width,
        height = height,
        col = center_in(vim.o.columns, width),
        row = center_in(vim.o.lines, height),
        border = "single"
    }
end

local function open_floating_file(file)
    if vim.fn.filereadable(file) == 0 then
        vim.notify("file not reachable: " .. file, vim.log.levels.ERROR)
        return
    end

    local buf = vim.fn.bufnr(file, true)

    if buf == -1 then
        vim.api.nvim_create_buf(false, false)
        vim.api.nvim_buf_set_name(buf, file)
    end

    vim.bo[buf].swapfile = false

    local win = vim.api.nvim_open_win(buf, true, win_config())

    vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "", {
        noremap = true,
        silent = true,
        callback = function()
            if vim.api.nvim_get_option_value("modified", {buf = buf}) == true then
                vim.notify("unsaved changes in " .. file, vim.log.levels.WARN)
            else
                vim.api.nvim_win_close(0, true)
            end

        end
    })
end

local function user_commands(opts)
    local target_file = os.getenv("HOME") .. "/todo.md"
    vim.api.nvim_create_user_command("Td", function()
        open_floating_file(target_file)
    end, {})
end

M.setup = function(opts)
    return {
        user_commands(opts),
    }
end

return M.setup()
