local keymap = vim.keymap.set
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        -- Disable arrow keys
        ["<Up>"] = false,
        ["<Down>"] = false,
        ["<Left>"] = false,
        ["<Right>"] = false,
        -- Customize
        ["<C-h>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.move_selection_next,
        ["<C-Up>"] = actions.preview_scrolling_up,
        ["<C-Down>"] = actions.preview_scrolling_down,
      },
      n = {
        -- Disable arrow keys
        ["<Up>"] = false,
        ["<Down>"] = false,
        ["<Left>"] = false,
        ["<Right>"] = false,
        -- Customize
        ["<C-h>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.move_selection_next,
        ["<C-Up>"] = actions.preview_scrolling_up,
        ["<C-Down>"] = actions.preview_scrolling_down,
      },
    },
  },
})

keymap('n', '<A-f>', builtin.buffers, {})
keymap('n', '<C-A-f>', function ()
  builtin.find_files({
    hidden = true,
    file_ignore_patterns = {
      ".git/",
			"__pycache__/",
			"venv/",
			"%.lock",
			"%.jpg", "%.jpeg", "%.png", "%.svg", "%.otf", "%.ttf",
    }
  })
end)
keymap('n', '<C-A-g>', builtin.live_grep, {})
