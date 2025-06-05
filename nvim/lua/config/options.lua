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

local special_filetypes = { "lua", "python", "rust" }

vim.api.nvim_create_augroup("FiletypeTabOverrides", { clear = true })

for _, ft in ipairs(special_filetypes) do
  vim.api.nvim_create_autocmd("FileType", {
    group = "FiletypeTabOverrides",
    pattern = ft,
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.expandtab = true
    end,
  })
end
