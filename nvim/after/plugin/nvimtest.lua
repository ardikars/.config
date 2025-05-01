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
	neotest.summary.open()
end, opts)
keymap('n', '<Leader>tt', function ()
	neotest.summary.close()
end, opts)
keymap('n', '<Leader>ttt', function ()
	neotest.run.stop()
end, opts)

