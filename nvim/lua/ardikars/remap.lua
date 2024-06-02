local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<C-z>", "<nop>", opts)

keymap('n', '<leader>ls', vim.cmd.Ex)

keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

keymap('n', '<leader>y', '\"+y', opts)
keymap('v', '<leader>y', '\"+y', opts)
keymap('n', '<leader>Y', '\"+Y', opts)

keymap('i', '<C-c>', '<Esc>', opts)
keymap('v', '<C-c>', '<Esc>', opts)

keymap('n', 'Q', '<nop>', opts)

keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)
keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)
