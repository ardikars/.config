vim.pack.add({
    {
        src = 'https://github.com/neovim/nvim-lspconfig',
        version = 'v2.7.0',
    },
    {
        src = 'https://github.com/mason-org/mason.nvim',
        version = 'v2.2.1',
    },
    {
        src = 'https://github.com/mason-org/mason-lspconfig.nvim',
        version = 'v2.1.0',
    },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "gopls" },
    automatic_enable = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
        vim.lsp.completion.enable(true, client.id, bufnr, {
            autotrigger = true,
            convert = function(item)
                return { abbr = item.label:gsub('%b()', '') }
            end,
        })
        vim.keymap.set('i', '<C-space>', vim.lsp.completion.get, { desc = 'trigger autocompletion' })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set('i', '<A-j>', function()
            if vim.fn.pumvisible() == 1 then
                return '<C-n>'
            else
                return '<C-x><C-o>' -- trigger omni completion (LSP)
            end
        end, { expr = true })
        vim.keymap.set('i', '<A-k>', function()
            if vim.fn.pumvisible() == 1 then
                return '<C-p>'
            else
                return '<C-p>'
            end
        end, { expr = true })

        vim.keymap.set('i', '<CR>', function()
            if vim.fn.pumvisible() == 1 then
                return '<C-y>'
            else
                return '<CR>'
            end
        end, { expr = true, buffer = bufnr })

        -- Code action
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)

        -- Auto-format code after saving
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, async = false })
                end,
            })
        end
    end,
})

vim.api.nvim_create_augroup('FiletypeTabOverrides', { clear = true })
for _, ft in ipairs({ 'lua', 'rust', 'java', 'go' }) do
    vim.api.nvim_create_autocmd('FileType', {
        group = 'FiletypeTabOverrides',
        pattern = ft,
        callback = function()
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.expandtab = true
        end,
    })
end
