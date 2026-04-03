vim.pack.add({
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
    version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  },
  {
    src = 'https://github.com/MunifTanjim/nui.nvim',
    version = '0.4.0',
  },
  {
    src = 'https://github.com/mfussenegger/nvim-dap',
    version = '0.10.0',
  },
  {
    src = 'https://github.com/nvim-java/nvim-java',
    version = 'v4.1.0',
  }
})

require('java').setup()
vim.lsp.enable('jdtls')
