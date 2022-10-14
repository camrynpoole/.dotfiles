local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "none" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- have packer manage itself
	use({ "wbthomason/packer.nvim", commit = " 6afb67460283f0e990d35d229fd38fdc04063e0a" })

	-- utility
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" })

	-- editing support
	use({ "numToStr/Comment.nvim", commit = "d9cfae1059b62f7eacc09dba181efe4894e3b086" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	use({ "chaoren/vim-wordmotion", commit = "5dd613ed68a0ecf0fc6c11cd4098c03583786bf0" })

	-- lsp
	use({ "neovim/nvim-lspconfig", commit = "af43c300d4134db3550089cd4df6c257e3734689" })
	use({ "williamboman/mason.nvim", commit = "d0072bef1af32bd1211e92f5230e0fb59548b53f" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" })
	use({ "SmiteshP/nvim-navic", commit = "132b273773768b36e9ecab2138b82234a9faf5ed" })

	-- completion
	use({ "hrsh7th/nvim-cmp", commit = "2427d06b6508489547cd30b6e86b1c75df363411" })
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" })
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" })
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" })
	use({ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" })

	-- ui
	use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
	use({ "NvChad/nvim-colorizer.lua", commit = "9dd7ecde55b06b5114e1fa67c522433e7e59db8b" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })

	-- navigation
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })

	-- syntax
	use({ "nvim-treesitter/nvim-treesitter", commit = "aebc6cf6bd4675ac86629f516d612ad5288f7868" })

	-- git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

	-- copilot
	use({
		"zbirenbaum/copilot.lua",
		event = { "VimEnter" },
		config = function()
			vim.defer_fn(function()
				require("user.copilot")
			end, 100)
		end,
	})
	use("zbirenbaum/copilot-cmp")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
