if vim.g.vscode then
-- VSCode extension
else
	-- ordinary Neovim
end

require("camryn.plugins")
require("camryn.colorscheme")
require("camryn.settings")
require("camryn.comment")
require("camryn.autocmds")
require("camryn.functions")
require("camryn.indent")
require("camryn.icons")
require("camryn.lualine")
require("camryn.telescope")
require("camryn.keymaps")
require("camryn.gitsigns")
require("camryn.navic")
require("camryn.winbar")
require("camryn.lsp")
require("camryn.cmp")
require("camryn.copilot")
require("camryn.treesitter")
