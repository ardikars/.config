return {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    opts = {},
    lazy = false,
    config = function()
        require("oil").setup({
            -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
            -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
            default_file_explorer = true,
            keymaps = {
                ["-"] = { "actions.parent", mode = "n" },
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
