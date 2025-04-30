require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
		relativenumber = true,
  },
	actions = {
    open_file = {
      quit_on_open = true,
    },
  },
	renderer = {
		group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<C-A-l>', ':NvimTreeToggle<CR>', opts);
