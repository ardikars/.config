return {
  'nvim-java/nvim-java',
  tag = 'v4.1.0',
  pin = true,
  submodules = true,
  module = false,
  config = function()
    require('java').setup()
    vim.lsp.enable('jdtls')
  end,
}
