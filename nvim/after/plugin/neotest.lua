local neotest = require("neotest")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

require("neotest").setup({
  adapters = {
    require("neotest-rust") {
        args = { "--no-capture" },
    }
  }
})

neotest.listeners = {
  run = {
    finished = function()
      vim.cmd("wincmd j") -- focus bottom panel
    end,
  },
}

keymap('n', '<Leader>tt', function ()
  neotest.run.run()
	neotest.output_panel.open();
end, opts)

keymap('n', '<Leader>ts', function ()
	neotest.run.stop()
end, opts)

