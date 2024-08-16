require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "pylsp" },
}

-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
