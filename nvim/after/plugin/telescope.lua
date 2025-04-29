local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-f>', builtin.buffers, {})
vim.keymap.set('n', '<C-A-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-A-g>', builtin.live_grep, {})
