vim.pack.add({
    {
        src = 'https://github.com/nvim-telescope/telescope.nvim',
        version = 'v0.2.2'
    },
})

local keymap = vim.keymap.set
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local layout_config = {
    preview_cutoff = 1, -- Always show preview
    mirror = false,
    height = 0.9,
    prompt_position = 'top',
    preview_height = 0.5, -- 50% of height goes to preview
}

local keymaps = {
    -- Disable arrow keys
    ['<Up>'] = false,
    ['<Down>'] = false,
    ['<Left>'] = false,
    ['<Right>'] = false,
    -- Customize
    ['<A-j>'] = actions.move_selection_next,
    ['<A-k>'] = actions.move_selection_previous,
    ['<A-l>'] = actions.preview_scrolling_down,
    ['<A-h>'] = actions.preview_scrolling_up,
}

local function noop() end

require('telescope').setup({
    defaults = {
        mappings = {
            i = keymaps,
            n = keymaps,
        },
        layout_strategy = 'vertical',
        layout_config = layout_config,
    },
    pickers = {
        marks = {
            marks = { "a-z", "A-Z" }, -- only show user marks
        },
        git_bcommits = {
            mappings = {
                i = { ["<CR>"] = noop },
                n = { ["<CR>"] = noop },
            },
        },
    },
})

local opts = { noremap = true, silent = true }

keymap('n', 'gg', builtin.git_bcommits,
    vim.tbl_extend('force', opts, { desc = 'Git commits history' }))
keymap('n', 'gd', builtin.lsp_definitions,
    vim.tbl_extend('force', opts, { desc = 'Go to definition (Telescope)' }))
keymap('n', 'gi', builtin.lsp_implementations,
    vim.tbl_extend('force', opts, { desc = 'List implementations (Telescope)' }))
keymap('n', 'gl', builtin.spell_suggest,
    vim.tbl_extend('force', opts, { desc = 'Spell suggestions (Telescope)' }))
keymap('n', 'gr', builtin.lsp_references, vim.tbl_extend('force', opts, { desc = 'Find references (Telescope)' }))
keymap('n', '<Leader>e', builtin.diagnostics, vim.tbl_extend('force', opts, { desc = 'LSP Diagnostics' }))
keymap('n', '<Leader>gs', builtin.lsp_document_symbols, vim.tbl_extend('force', opts, { desc = 'LSP document symbols' }))
keymap('n', '<Leader>gss', builtin.lsp_workspace_symbols,
    vim.tbl_extend('force', opts, { desc = 'LSP workspace symbols' }))
keymap('n', '<Leader>gtd', builtin.lsp_type_definitions, vim.tbl_extend('force', opts, { desc = 'LSP type definitions' }))
keymap('n', '<Leader>m', builtin.marks, vim.tbl_extend('force', opts, { desc = 'List marks' }))

vim.diagnostic.config({
    -- virtual_lines = true,
    -- virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
})

-- Diagnostics
vim.keymap.set('n', '<leader>E', function()
    local bufnr0, winid = vim.diagnostic.open_float(
        {
            border = 'rounded',
            scope = 'line',
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
        end, { buffer = bufnr0, nowait = true, noremap = true, silent = true })
    end
end, { desc = 'Show diagnostics in a float' })


local file_ignore_patterns = {
    '.git/',
    '__pycache__/',
    '.pytest_cache/',
    'venv/',
    'target/',
    'build/',
    'node_modules/',
    'dist/',
    'package-lock.json',
    '%.lock',
    '%.DS_Store',
    '%.jpg', '%.jpeg', '%.png', '%.svg', '%.otf', '%.ttf', '%.bmp',
    '%.mp3', '%.wav', '%.ogg', '%.flac',
    '%.mp4', '%.mkv', '%.avi', '%.mov', '%.webm', '%.flv',
}

keymap({ 'n' }, '<Leader>ff', function()
    builtin.find_files({
        hidden = true,
        file_ignore_patterns = file_ignore_patterns
    })
end)

keymap({ 'n' }, '<Leader>fff', function()
    vim.ui.input({ prompt = 'Directory: ', completion = 'dir' }, function(dir)
        if dir and dir ~= '' then
            builtin.find_files({
                cwd = dir,
                hidden = true,
                file_ignore_patterns = file_ignore_patterns
            })
        end
    end)
end)

keymap({ 'n' }, '<Leader>fg', function()
    builtin.live_grep({
        hidden = true,
        file_ignore_patterns = file_ignore_patterns
    })
end)

keymap({ 'n' }, '<Leader>fgg', function()
    vim.ui.input({ prompt = 'Directory: ', completion = 'dir' }, function(dir)
        if dir and dir ~= '' then
            builtin.live_grep({
                cwd = dir,
                hidden = true,
                file_ignore_patterns = file_ignore_patterns
            })
        end
    end)
end)
