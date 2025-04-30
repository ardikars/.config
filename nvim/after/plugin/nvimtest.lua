require("neotest").setup({
  adapters = {
    require("neotest-rust") {
        args = { "--no-capture" },
    }
  }
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap('n', '<Leader>t', function ()
  require("neotest").run.run()
	require("neotest").summary.open()
end, opts)
keymap('n', '<Leader>tt', function ()
	require("neotest").summary.close()
end, opts)
keymap('n', '<Leader>ttt', function ()
	require("neotest").run.stop()
end, opts)
