require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
  automatic_installation = true,
})

local dap = require('dap')
local keymap = vim.keymap.set

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

require("dapui").setup()
require("nvim-dap-virtual-text").setup()
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

keymap("n", "<A-N>", dap.continue, opts)
keymap("n", "<A-nn>", dap.step_over, opts)
keymap("n", "<A-n>", dap.step_into, opts)
keymap("n", "<A-nnn>", dap.step_out, opts)
keymap("n", "<A-b>", dap.toggle_breakpoint, opts)

