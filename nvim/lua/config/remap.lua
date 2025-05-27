local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- file explorer
-- keymap("n", "<Leader>l", vim.cmd.Ex, opts);

-- prevent freezes/suspends (go back to terminal shell)
keymap("n", "<C-z>", "<nop>", opts)

-- moving multiple line up and down
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- moving cursor
keymap("v", "L", "w", opts)
keymap("v", "H", "b", opts)

-- yanking using system clipboard
keymap('n', '<A-y>', '\"+y', opts)
keymap('v', '<A-y>', '\"+y', opts)
keymap('n', '<A-Y>', '\"+Y', opts)

-- back to normal mode from insert/visual mode
keymap({ 'i', 'v' }, '<C-c>', '<Esc>', opts)
keymap({ 't' }, '<Esc><Esc>', '<C-\\><C-n>', opts)

-- disable Ex mode (a weird old mode from classic Vim)
keymap('n', 'Q', '<nop>', opts)

-- disable arrow keys
keymap({ 'n', 'i', 'v' }, '<Up>', '<Nop>', opts)
keymap({ 'n', 'i', 'v' }, '<Down>', '<Nop>', opts)
keymap({ 'n', 'i', 'v' }, '<Left>', '<Nop>', opts)
keymap({ 'n', 'i', 'v' }, '<Right>', '<Nop>', opts)

keymap({ 'n', 'i', 'v' }, '<A-h>', vim.cmd.bprevious)
keymap({ 'n', 'i', 'v' }, '<A-l>', vim.cmd.bnext)
keymap({ 'n', 'i', 'v' }, '<A-d>', vim.cmd.bdelete)
