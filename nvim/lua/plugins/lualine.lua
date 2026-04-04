vim.pack.add({
    {
        src = 'https://github.com/nvim-lualine/lualine.nvim',
        version = '47f91c416daef12db467145e16bed5bbfe00add8'
    },
    {
        src = 'https://github.com/linrongbin16/lsp-progress.nvim',
        version = 'v2.0.0'
    },
})

require("lsp-progress").setup({})
require('lualine').setup({
    sections = {
        lualine_c = {
            function()
                return require('lsp-progress').progress()
            end,
        },
    }
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup('lualine_augroup', { clear = true })
vim.api.nvim_create_autocmd('User', {
    group = 'lualine_augroup',
    pattern = 'LspProgressStatusUpdated',
    callback = require('lualine').refresh,
})
