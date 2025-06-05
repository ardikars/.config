return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "lua", "rust", "java", "python" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enabled = true
            }
        }
    end
}
