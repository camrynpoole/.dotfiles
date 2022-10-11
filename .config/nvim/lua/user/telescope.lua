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
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<c-d>"] = actions.delete_buffer,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["h"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
				["dd"] = actions.delete_buffer,
				["t"] = actions.select_tab,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,
			},
		},
		pickers = {
			find_files = {},
			treesitter = {},
		},
	},
})

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
