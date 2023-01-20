----------------------------------------------------------
-- Plugins
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
	-- utility
	"nvim-lua/plenary.nvim",
	"numToStr/Comment.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"chaoren/vim-wordmotion",
	"tpope/vim-unimpaired",

	-- ui
	"kyazdani42/nvim-web-devicons",
	"nvim-treesitter/nvim-treesitter",
	"ellisonleao/gruvbox.nvim",
	"nvim-lualine/lualine.nvim",

	-- navigation
	"nvim-telescope/telescope.nvim",

	--lsp
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"SmiteshP/nvim-navic",

	--completions
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",

	--snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	--git
	"lewis6991/gitsigns.nvim",
	{
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("camryn.copilot")
			end, 100)
		end,
	},
	"zbirenbaum/copilot-cmp",
})
