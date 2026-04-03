return {
    "xiantang/darcula-dark.nvim",
    commit = '285c1fe3225ef19ef2639a3080551ee9669f263b',
    pin = true,
    submodules = true,
    module = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
        vim.cmd("colorscheme darcula-dark")
    end,
}
