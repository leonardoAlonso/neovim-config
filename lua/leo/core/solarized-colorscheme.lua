-- set colorscheme to nightfly with protected call
-- in case it isn't installed

local status, _ = pcall(vim.cmd, "colorscheme kanagawa")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

local status, solarized = pcall(require, "kanagawa")
if not status then
	return
end

solarized.setup({
	theme = "wave",
})
