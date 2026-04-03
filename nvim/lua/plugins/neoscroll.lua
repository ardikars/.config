vim.pack.add({
	{
		src = 'https://github.com/karb94/neoscroll.nvim',
		version = 'c8d29979cb0cb3a2437a8e0ae683fd82f340d3b8'
	},
})

local neoscroll = require('neoscroll')
local keymap = {
    ["<A-k>"] = function() neoscroll.ctrl_u({ duration = 250 }) end,
    ["<A-j>"] = function() neoscroll.ctrl_d({ duration = 250 }) end,
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
end
