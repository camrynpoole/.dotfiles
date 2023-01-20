-----------------------------------------------------------
-- Treesitter configuration
-----------------------------------------------------------
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "phpdoc", "tree-sitter-phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
	},
})
