-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = { { 'nvim-lua/plenary.nvim' } } }
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use {
		  'VonHeikemen/lsp-zero.nvim',
		  branch = 'v3.x',
		  requires = {
				  {'williamboman/mason.nvim'},
				  {'williamboman/mason-lspconfig.nvim'},
				  -- LSP Support
				  {'neovim/nvim-lspconfig'},
				  -- Autocompletion
				  {'hrsh7th/nvim-cmp'},
				  {'hrsh7th/cmp-nvim-lsp'},
				  {'L3MON4D3/LuaSnip'},
		  }
  }
  use {
		  'nvim-neo-tree/neo-tree.nvim',
		  branch = 'v3.x',
		  requires = {
				  'nvim-lua/plenary.nvim',
				  'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
				  'MunifTanjim/nui.nvim',
    }
  }

  use {
		  'akinsho/bufferline.nvim',
		  tag = "*",
		  requires = 'nvim-tree/nvim-web-devicons'
  }
  end)
