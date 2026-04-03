return {
    'nvim-lualine/lualine.nvim',
    commit = '47f91c416daef12db467145e16bed5bbfe00add8',
    pin = true,
    submodules = true,
    module = false,
    dependencies = { 
        'nvim-tree/nvim-web-devicons' 
    },
    config = function()
        require('lualine').setup {}
    end
}
