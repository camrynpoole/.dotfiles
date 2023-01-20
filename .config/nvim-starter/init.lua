----------------------------------------------------------
-- Nvim-starter configuration file
-----------------------------------------------------------
----------------------------------------------------------
-- Plugins configuration
-----------------------------------------------------------
-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
-- use a protected call
vim.opt.runtimepath:prepend(lazypath)
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

lazy.setup({
	-- Lsp
	"wbthomason/packer.nvim",
	"VonHeikemen/lsp-zero.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- Colorscheme
	"ellisonleao/gruvbox.nvim",
})

----------------------------------------------------------
-- Colorscheme configuration
-----------------------------------------------------------
vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

----------------------------------------------------------
-- Lsp-Zero configuration
-----------------------------------------------------------
-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.setup()

-----------------------------------------------------------
-- Keymaps
-----------------------------------------------------------
local keymap = vim.keymap.set
local opts = { silent = true }
vim.g.mapleader = ","

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
