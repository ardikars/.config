return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require 'nvim-treesitter.configs'
        treesitter.setup {
            ensure_installed = { "lua", "rust", "python", "java" },
            sync_install = false,
            auto_install = true,
            ignore_install = { "javascript" },
            parser_install_dir = nil,
            highlight = {
                enable = true,
            },
            modules = {}
        }
    end
}
