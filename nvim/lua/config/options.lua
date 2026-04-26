local options = {
    title = true,
    fileencoding = 'utf-8',
    encoding = 'utf-8',
    number = true,
    relativenumber = true,
    termguicolors = true,
    shiftwidth = 2,
    shiftround = true,
    ignorecase = true,
    smartcase = true,
    hlsearch = false,
    wrap = false,
    breakindent = true,
    cursorline = true,
    colorcolumn = "80", --  add a color column at 80 characters
    signcolumn = "yes", -- always show the sign column
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
    shada = '',        -- stop marks from persisting
    splitright = true, -- force vertical splits to always open on the right
    lazyredraw = true, -- redraw the screen less during computationally intensive tasks
    shell = "sh",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
