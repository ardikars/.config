vim.diagnostic.config({
    -- virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.keymap.set('n', '<leader>E', function()
    local bufnr, winid = vim.diagnostic.open_float(
        {
            border = "rounded",
            scope = "line",
            severity_sort = true,
            focusable = true,
            source = true,
        }
    )
    if winid then
        vim.api.nvim_set_current_win(winid)
        -- Set a buffer-local keymap
        vim.keymap.set('n', 'q', function()
            vim.api.nvim_win_close(winid, true)
        end, { buffer = bufnr, nowait = true, noremap = true, silent = true })
    end
end, { desc = "Show diagnostics in a float" })
