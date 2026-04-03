return {
  'ray-x/go.nvim',
  dependencies = {
    'ray-x/guihua.lua', -- optional
    'nvim-treesitter/nvim-treesitter',
    'neovim/nvim-lspconfig',
  },
  opts = { lsp_cfg = true }, -- use go.nvim will setup gopls
  config = function(lp, opts)
    require("go").setup(opts)
    --
    -- format config here
    --
    local gopls_cfg = require('go.lsp').config()
    -- gopls_cfg.filetypes = { 'go', 'gomod'}, -- override settings
    vim.lsp.config.gopls = gopls_cfg
    vim.lsp.enable('gopls')
  end
}
