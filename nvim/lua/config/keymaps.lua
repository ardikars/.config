local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- prevent freezes/suspends (go back to terminal shell)
keymap('n', '<C-z>', '<nop>', opts)

-- Remap 'd' in normal and visual mode to not yank (delete to black hole register)
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)
-- In visual mode, paste without yanking the replaced text
keymap('v', 'p', '"_dP', opts)

-- moving multiple line up and down
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")
keymap({ 'n' }, 'J', 'j', opts)
keymap({ 'n' }, 'K', 'k', opts)

-- back to normal mode from insert/visual mode
keymap({ 'n', 'i', 'v', 's' }, '<C-c>', '<Esc>', opts)
keymap({ 'n', 'i', 'v', 's' }, '<A-c>', '<Esc>', opts)
keymap({ 'n', 'i', 'v', 's' }, '<A-c>', '<Esc>', opts)
keymap({ 't' }, '<Esc><Esc>', '<C-\\><C-n>', opts)

-- disable Ex mode (a weird old mode from classic Vim)
keymap('n', 'Q', '<nop>', opts)

-- disable arrow keys
keymap({ 'n', 'i', 'v' }, '<Up>', '<Nop>', opts)
keymap({ 'n', 'i', 'v' }, '<Down>', '<Nop>', opts)
keymap({ 'n', 'i', 'v' }, '<Left>', '<Nop>', opts)
keymap({ 'n', 'i', 'v' }, '<Right>', '<Nop>', opts)

keymap({ 'n', 'i', 'v' }, '<C-h>', ':vertical resize -3<CR>', opts)
keymap({ 'n', 'i', 'v' }, '<C-l>', ':vertical resize +3<CR>', opts)
keymap({ 'n', 'i', 'v' }, '<C-j>', ':horizontal resize -3<CR>', opts)
keymap({ 'n', 'i', 'v' }, '<C-k>', ':horizontal resize +3<CR>', opts)

keymap({ 'n', 'i', 'v' }, '<A-H>', vim.cmd.bprevious, opts)
keymap({ 'n', 'i', 'v' }, '<A-L>', vim.cmd.bnext, opts)
keymap({ 'n', 'i', 'v' }, '<A-D>', vim.cmd.bdelete, opts)
keymap({ 'n', 'i', 'v' }, '<A-Q>', function() vim.cmd.bdelete({ bang = true }) end, opts)

keymap({ 'n', 'v' }, 'q', function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= '' then
            vim.api.nvim_win_close(win, true)
        end
    end
end, opts)
