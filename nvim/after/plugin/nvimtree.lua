local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

	vim.keymap.set("n", "<CR>",           api.node.open.preview,              opts("Open Preview"))
	vim.keymap.set("n", "<C-A-e>",        api.node.open.edit,                 opts("Open"))
	vim.keymap.set("n", "<C-A-a>",        api.fs.create,                      opts("Create File Or Directory"))
	vim.keymap.set("n", "<C-A-d>",        api.fs.remove,                      opts("Delete"))
	vim.keymap.set("n", "<C-A-r>",        api.fs.rename,                      opts("Rename"))
	vim.keymap.set('n', '<C-A-l>',        ':NvimTreeToggle<CR>',              { noremap = true, silent = true })
end

require("nvim-tree").setup({
	on_attach = my_on_attach,
	sort = {
		sorter = "case_sensitive",
	},
  view = {
		relativenumber = true,
		adaptive_size = true,
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
    dotfiles = false,
  },
})

