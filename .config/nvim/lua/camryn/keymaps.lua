-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
local keymap = vim.keymap.set
local opts = { silent = true }
vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- move to first whitespace
keymap("n", "0", "^", opts)

-- keep selection after indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- netrw shortcut
keymap("n", "<leader>e", "<cmd>Lexplore<CR>", opts)

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
-- telescope
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
