return {
    'akinsho/bufferline.nvim',
    tag = 'v4.9.1',
    pin = true,
    submodules = true,
    module = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("bufferline").setup {}
    end
}
