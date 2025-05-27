local options = {
  fileencoding = "utf-8",
  encoding = "utf-8",
  number = true,
  relativenumber = true,
  termguicolors = true,
  tabstop = 2,
  expandtab = false,
  shiftwidth = 2,
  ignorecase = true,
  hlsearch = false,
  wrap = true,
  breakindent = true,
  clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- 1. Set global default tab size for all files
vim.opt.tabstop = 4       -- Default: 2 spaces per tab
vim.opt.shiftwidth = 4    -- Default: 2 spaces for indent
vim.opt.expandtab = false -- Use spaces instead of tab characters

-- 2. Override tab settings for specific filetypes
local special_filetypes = { "lua", "python", "c", "rust", "json", "yaml", "bash", "sh" }

vim.api.nvim_create_augroup("FiletypeTabOverrides", { clear = true })

for _, ft in ipairs(special_filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    group = "FiletypeTabOverrides",
    pattern = ft,
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
    end,
  })
end
