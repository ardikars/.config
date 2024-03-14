local options = {
	fileencoding = "utf-8",
	number = true,
	relativenumber = true,
	tabstop = 4
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
