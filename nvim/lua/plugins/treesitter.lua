return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "lua", "rust" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enabled = true
                }
            }
        end
    }
}
