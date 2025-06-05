return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "jdtls" },
        automatic_enable = true,
    },
    dependencies = {
        {
            "mason-org/mason.nvim", opts = {}
        },
        {
            "neovim/nvim-lspconfig",
        }
    },
}
