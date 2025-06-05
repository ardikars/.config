return {
    "ggandor/leap.nvim",
    config = function()
        vim.keymap.set({ 'n', 'v' }, 's', '<Plug>(leap-anywhere)')
    end
}
