vim.pack.add({
	{
		src = 'https://github.com/nvim-tree/nvim-tree.lua',
		version = 'v1.16.0'
	},
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup(
	{
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  }
)
local keymap = vim.keymap.set
keymap('n', '+', function ()
	require("nvim-tree.api").tree.toggle({ find_file = false, update_root = true, focus = true, })
end)

