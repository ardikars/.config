return {
  "nvim-tree/nvim-tree.lua",
  tag = 'v1.16.0',
  pin = true,
  submodules = true,
  module = false,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
