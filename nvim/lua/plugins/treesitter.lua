vim.pack.add({
	{
		src = 'https://github.com/nvim-treesitter/nvim-treesitter',
		version = '539abf6da5ee8702e37b82cc953131dadd570da2'
	},
})

require('nvim-treesitter').install { 'lua', 'rust', 'go', 'java' }
