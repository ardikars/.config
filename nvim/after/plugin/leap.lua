local keymap = vim.keymap.set

keymap({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
keymap({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
