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

keymap('n', '<Leader>t', function ()
	neotest.run.run()
	neotest.output_panel.open()
end, opts)

keymap('n', '<Leader>tt', function ()
	neotest.output_panel.clear()
	neotest.output_panel.close()
end, opts)

keymap('n', '<Leader>ttt', function ()
	neotest.run.stop()
end, opts)

