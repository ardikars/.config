return {
    "nvim-neotest/neotest",
    dependencies = {
        {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        {
            "rouge8/neotest-rust", -- Rust (require cargo-nextest)
        },
        {
            "rcasia/neotest-java",
            ft = "java",
            dependencies = {
                "mfussenegger/nvim-jdtls",
            },
        },
        {
            "nvim-neotest/neotest-python",
        }
    },
    config = function()
        local neotest = require("neotest")

        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap.set

        require("neotest").setup {
            adapters = {
                require("neotest-rust") {
                    args = { "--no-capture" },
                },
                require("neotest-java") {
                    --
                },
                require("neotest-python") {
                    runner = "pytest",
                    python = ".venv/bin/python",
                }
            }
        }

        keymap('n', '<Leader>tt', function()
            neotest.run.run()
        end, opts)

        keymap('n', '<Leader>to', function()
            neotest.output.open({ enter = true, auto_close = true })
        end, opts)

        keymap('n', '<Leader>ts', function()
            neotest.run.stop()
        end, opts)
    end
}
