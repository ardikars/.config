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
        ["<A-h>"] = actions.preview_scrolling_down,
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
        ["<A-l>"] = actions.preview_scrolling_up,
      },
      n = {
        -- Disable arrow keys
        ["<Up>"] = false,
        ["<Down>"] = false,
        ["<Left>"] = false,
        ["<Right>"] = false,
        -- Customize
        ["<A-h>"] = actions.preview_scrolling_down,
        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,
        ["<A-l>"] = actions.preview_scrolling_up,
      },
   },
  },
})

keymap({'n'}, '<Leader>f', function ()
  builtin.find_files({
    hidden = true,
    file_ignore_patterns = {
      ".git/",
      "__pycache__/",
      "venv/",
      "target/",
      "build/",
      "%.lock",
      "%.DS_Store",
      "%.jpg", "%.jpeg", "%.png", "%.svg", "%.otf", "%.ttf", "%.bmp",
      "%.mp3", "%.wav", "%.ogg", "%.flac",
      "%.mp4", "%.mkv", "%.avi", "%.mov", "%.webm", "%.flv",
    }
  })
end)

keymap({'n'}, '<Leader>g', function ()
  builtin.live_grep({
    hidden = true,
    file_ignore_patterns = {
      ".git/",
      "__pycache__/",
      "venv/",
      "target/",
      "build/",
      "%.lock",
      "%.DS_Store",
      "%.jpg", "%.jpeg", "%.png", "%.svg", "%.otf", "%.ttf", "%.bmp",
      "%.mp3", "%.wav", "%.ogg", "%.flac",
      "%.mp4", "%.mkv", "%.avi", "%.mov", "%.webm", "%.flv",
    }
  })
end)
