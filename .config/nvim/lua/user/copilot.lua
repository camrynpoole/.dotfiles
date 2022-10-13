local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

local status_c_ok, copilot_client = pcall(require, "copilot-client")
if not status_c_ok then
	return
end

copilot.setup({
	cmp = {
		enabled = false, -- no need for cmp
	},
})

copilot_client.setup({
	mapping = {
		accept = "<CR>",
	},
})

-- Create a keymap that triggers the suggestion. To accept suggestion press <CR> as set in the setup.
vim.api.nvim_set_keymap(
	"i",
	"<C-c>",
	'<cmd>lua require("copilot-client").suggest()<CR>',
	{ noremap = true, silent = true }
)
