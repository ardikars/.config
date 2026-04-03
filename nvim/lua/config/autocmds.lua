vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(args)
        -- Auto-format code after saving
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})

vim.api.nvim_create_augroup("FiletypeTabOverrides", { clear = true })
for _, ft in ipairs({ "lua", "rust", "java", "go" }) do
    vim.api.nvim_create_autocmd("FileType", {
        group = "FiletypeTabOverrides",
        pattern = ft,
        callback = function()
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.expandtab = true
        end,
    })
end 
