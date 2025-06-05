local options = {
    title = true,
    fileencoding = "utf-8",
    encoding = "utf-8",
    number = true,
    relativenumber = true,
    termguicolors = true,
    tabstop = 2,
    expandtab = false,
    shiftwidth = 2,
    ignorecase = true,
    smartcase = true,
    hlsearch = false,
    wrap = true,
    breakindent = true,
    clipboard = "unnamedplus",
    syntax = "ON",
    mouse = "",
    showcmd = true,
    showmode = true,
    scrolloff = 5,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
