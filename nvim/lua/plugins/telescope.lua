return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.2',
    pin = true,
    submodules = true,
    module = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local keymap = vim.keymap.set
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')

        local layout_config = {
            preview_cutoff = 1, -- Always show preview
            mirror = false,
            height = 0.9,
            prompt_position = "top",
            preview_height = 0.5, -- 50% of height goes to preview
        }

        local keymaps = {
            -- Disable arrow keys
            ["<Up>"] = false,
            ["<Down>"] = false,
            ["<Left>"] = false,
            ["<Right>"] = false,
            -- Customize
            ["<A-j>"] = actions.move_selection_next,
            ["<A-k>"] = actions.move_selection_previous,
            ["<A-l>"] = actions.preview_scrolling_down,
            ["<A-h>"] = actions.preview_scrolling_up,
        }

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = keymaps,
                    n = keymaps,
                },
                layout_strategy = "vertical",
                layout_config = layout_config,
            },
        })

        local opts = { noremap = true, silent = true }
        keymap('n', 'gd', builtin.lsp_definitions,
            vim.tbl_extend('force', opts, { desc = 'Go to definition (Telescope)' }))
        keymap('n', 'gi', builtin.lsp_implementations,
            vim.tbl_extend('force', opts, { desc = 'List implementations (Telescope)' }))
        keymap('n', 'gs', builtin.spell_suggest,
            vim.tbl_extend('force', opts, { desc = 'Spell suggestions (Telescope)' }))
        keymap('n', 'gr', builtin.lsp_references, vim.tbl_extend('force', opts, { desc = 'Find references (Telescope)' }))
        keymap('n', '<Leader>e', builtin.diagnostics, vim.tbl_extend('force', opts, { desc = 'LSP Diagnostics' }))

        local file_ignore_patterns = {
            ".git/",
            "__pycache__/",
            ".pytest_cache/",
            "venv/",
            "target/",
            "build/",
            "node_modules/",
            "dist/",
            "package-lock.json",
            "%.lock",
            "%.DS_Store",
            "%.jpg", "%.jpeg", "%.png", "%.svg", "%.otf", "%.ttf", "%.bmp",
            "%.mp3", "%.wav", "%.ogg", "%.flac",
            "%.mp4", "%.mkv", "%.avi", "%.mov", "%.webm", "%.flv",
        }

        keymap({ 'n' }, '<Leader>ff', function()
            builtin.find_files({
                hidden = true,
                file_ignore_patterns = file_ignore_patterns
            })
        end)

        keymap({ 'n' }, '<Leader>fff', function()
            vim.ui.input({ prompt = "Directory: ", completion = "dir" }, function(dir)
                if dir and dir ~= "" then
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
            vim.ui.input({ prompt = "Directory: ", completion = "dir" }, function(dir)
                if dir and dir ~= "" then
                    builtin.live_grep({
                        cwd = dir,
                        hidden = true,
                        file_ignore_patterns = file_ignore_patterns
                    })
                end
            end)
        end)
    end
}
