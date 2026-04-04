local options = {
    title = true,
    fileencoding = 'utf-8',
    encoding = 'utf-8',
    number = true,
    relativenumber = true,
    termguicolors = true,
    shiftwidth = 2,
    ignorecase = true,
    smartcase = true,
    hlsearch = false,
    wrap = true,
    breakindent = true,
    clipboard = 'unnamedplus',
    syntax = 'ON',
    mouse = '',
    showcmd = true,
    showmode = true,
    scrolloff = 5,
    smarttab = true,
    smartindent = true,
    autoindent = true,
    expandtab = false,
    tabstop = 2,
    shada = '', -- stop marks from persisting
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
