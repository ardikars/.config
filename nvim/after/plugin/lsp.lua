require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local servers = { 'lua_ls', 'pyright', 'rust_analyzer' }
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
  }
end

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'nvim_lsp_signature_help'},
    {name = 'nvim_lsp_document_symbol'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  mapping = cmp.mapping.preset.insert({
    ['<A-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<A-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<A-l>'] = cmp.mapping.scroll_docs(4),
    ['<A-h>'] = cmp.mapping.scroll_docs(-4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
  automatic_installation = true,
})

local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
    args = { "--port", "${port}" },
  }
}

dap.configurations.rust = {
  {
    name = "Debug Rust",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

keymap("n", "<F5>", dap.continue, opts)
keymap("n", "<F10>", dap.step_over, opts)
keymap("n", "<F11>", dap.step_into, opts)
keymap("n", "<F12>", dap.step_out, opts)
keymap("n", "<Leader>b", dap.toggle_breakpoint, opts)

require("dapui").setup()
local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
