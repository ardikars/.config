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
require('java').setup({
  -- Startup checks
  checks = {
    nvim_version = false,        -- Check Neovim version
    nvim_jdtls_conflict = false, -- Check for nvim-jdtls conflict
  },

  -- JDTLS configuration
  jdtls = {
    version = '1.43.0',
  },

  -- Extensions
  lombok = {
    enable = true,
    version = '1.18.40',
  },

  java_test = {
    enable = true,
    version = '0.40.1',
  },

  java_debug_adapter = {
    enable = true,
    version = '0.58.2',
  },

  spring_boot_tools = {
    enable = true,
    version = '1.55.1',
  },

  -- JDK installation
  jdk = {
    auto_install = true,
    version = '17',
  },

  -- Logging
  log = {
    use_console = true,
    use_file = true,
    level = 'info',
    log_file = vim.fn.stdpath('state') .. '/nvim-java.log',
    max_lines = 1000,
    show_location = false,
  },
})

vim.lsp.config('jdtls', {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = vim.fn.stdpath("data") .. "/nvim-java/packages/openjdk/25/jdk-25.0.2",
            default = true,
          }
        }
      },
    }
  }
})

vim.lsp.enable('jdtls')
