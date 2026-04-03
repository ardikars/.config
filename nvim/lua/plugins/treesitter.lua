return {
    "nvim-treesitter/nvim-treesitter",
    commit = '539abf6da5ee8702e37b82cc953131dadd570da2',
    pin = true,
    submodules = true,
    module = false,
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').install { 'lua', 'rust', 'go', 'java' }
    end
}
