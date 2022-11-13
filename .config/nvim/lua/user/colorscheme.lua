local status_ok, vscode = pcall(require, "vscode")
if not status_ok then
	return
end

vscode.setup({
	transparent = true,
})
