return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "rouge8/neotest-rust", -- Rust (require cargo-nextest)
    },
    config = function()
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

        keymap('n', '<Leader>t', function()
            neotest.run.run()
        end, opts)

        keymap('n', '<Leader>to', function()
            neotest.output_panel.open()
        end, opts)

        keymap('n', '<Leader>too', function()
            neotest.output_panel.close()
        end, opts)

        keymap('n', '<Leader>tc', function()
            if neotest.output_panel then
                neotest.output_panel.clear()
            end
        end, opts)

        keymap('n', '<Leader>ts', function()
            neotest.run.stop()
        end, opts)
    end
}
