local options = {
	fileencoding = "utf-8",
  encoding = "utf-8",
	number = true,
	relativenumber = true,
	termguicolors = true,
	tabstop=2,
  shiftwidth=2,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

