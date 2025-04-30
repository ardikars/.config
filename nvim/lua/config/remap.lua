local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.g.mapleader = " "

-- prevent freezes/suspends (go back to terminal shell)
keymap("n", "<C-z>", "<nop>", opts)

-- list file in current directory
keymap('n', '<C-A-l>', vim.cmd.Vex)

-- moving multiple line up and down
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- yanking using system clipboard
keymap('n', '<A-y>', '\"+y', opts)
keymap('v', '<A-y>', '\"+y', opts)
keymap('n', '<A-Y>', '\"+Y', opts)

-- back to normal mode from insert/visual mode
keymap('i', '<C-c>', '<Esc>', opts)
keymap('v', '<C-c>', '<Esc>', opts)

-- disable Ex mode (a weird old mode from classic Vim)
keymap('n', 'Q', '<nop>', opts)

-- exec last command
keymap('n', '<Leader><CR>', ':@:<CR>', opts)

-- disable arrow keys
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)
keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)
keymap('v', '<Up>', '<Nop>', opts)
keymap('v', '<Down>', '<Nop>', opts)
keymap('v', '<Left>', '<Nop>', opts)
keymap('v', '<Right>', '<Nop>', opts)

keymap('n', '<A-h>', vim.cmd.bprevious)
keymap('n', '<A-k>', vim.cmd.bprevious)
keymap('n', '<A-l>', vim.cmd.bnext)
keymap('n', '<A-j>', vim.cmd.bnext)
keymap('n', '<A-d>', vim.cmd.bdelete)
keymap('v', '<A-h>', vim.cmd.bprevious)
keymap('v', '<A-k>', vim.cmd.bprevious)
keymap('v', '<A-l>', vim.cmd.bnext)
keymap('v', '<A-j>', vim.cmd.bnext)
keymap('v', '<A-d>', vim.cmd.bdelete)
keymap('i', '<A-h>', vim.cmd.bprevious)
keymap('i', '<A-k>', vim.cmd.bprevious)
keymap('i', '<A-l>', vim.cmd.bnext)
keymap('i', '<A-j>', vim.cmd.bnext)
keymap('i', '<A-d>', vim.cmd.bdelete)
