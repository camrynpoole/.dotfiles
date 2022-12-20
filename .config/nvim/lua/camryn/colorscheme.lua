local status_ok, gruvbox = pcall(require, "gruvbox")
if not status_ok then
	return
end

gruvbox.setup({
	transparent_mode = true,
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
