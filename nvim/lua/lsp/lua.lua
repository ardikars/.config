local lua_ls_path = vim.fn.expand("~/.local/opt/lua-ls/bin/lua-language-server")

local config = {
  cmd = { lua_ls_path },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      telemetry = { enable = false },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
    },
  },
}

vim.lsp.config('lua_ls', config)
vim.lsp.enable('lua_ls')

