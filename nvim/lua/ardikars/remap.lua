vim.g.mapleader = " "
vim.keymap.set('n', '<C-p>', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('v', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
