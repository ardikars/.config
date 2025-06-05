local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- prevent freezes/suspends (go back to terminal shell)
keymap("n", "<C-z>", "<nop>", opts)

-- rename word with same name
keymap('v', '<Leader>rn', '"hy:%s/<C-r>h//g<left><left>', opts)

-- moving multiple line up and down
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- moving cursor
keymap("v", "L", "w", opts)
keymap("v", "H", "b", opts)

-- same as terminal emulator keymap
keymap({ 'n', 'v' }, '<C-S-c>', 'y', opts)
keymap({ 'n', 'v' }, '<C-S-v>', 'p', opts)

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

keymap({ 'n', 'i', 'v' }, '<C-h>', '<C-w><C-h>', opts)
keymap({ 'n', 'i', 'v' }, '<C-l>', '<C-w><C-l>', opts)
keymap({ 'n', 'i', 'v' }, '<C-j>', '<C-w><C-j>', opts)
keymap({ 'n', 'i', 'v' }, '<C-k>', '<C-w><C-k>', opts)

keymap({ 'n', 'i', 'v' }, '<C-Left>', ':vertical resize -3<CR>', opts)
keymap({ 'n', 'i', 'v' }, '<C-Right>', ':vertical resize +3<CR>', opts)
keymap({ 'n', 'i', 'v' }, '<C-Down>', ':horizontal resize -3<CR>', opts)
keymap({ 'n', 'i', 'v' }, '<C-Up>', ':horizontal resize +3<CR>', opts)

keymap({ 'n', 'i', 'v' }, '<A-H>', vim.cmd.bprevious)
keymap({ 'n', 'i', 'v' }, '<A-L>', vim.cmd.bnext)
keymap({ 'n', 'i', 'v' }, '<A-D>', vim.cmd.bdelete)
