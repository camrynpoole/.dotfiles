local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		results_title = false,
		preview = false,
		border = {},
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-h>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<c-d>"] = actions.delete_buffer,
				["<esc>"] = actions.close,
			},
		},
		pickers = {
			find_files = {},
			treesitter = {},
		},
	},
})
