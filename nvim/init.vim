lua require('config')

call plug#begin()
" Show Neovim status
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

" Telescope (Find file/words)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" :Explorer
Plug 'stevearc/oil.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'

" Bufferline (buffer tabs)
" dup: Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Treesitter (syntax highlighting)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NVim Test
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-neotest/neotest'
" NVim Test - Rust (require cargo-nextest)
Plug 'rouge8/neotest-rust'

" Language Server Protocol (LSP)
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" LSP diagnostic virtual text
Plug 'rachartier/tiny-inline-diagnostic.nvim'

" Debugger (DAP)
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jay-babu/mason-nvim-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
call plug#end()
