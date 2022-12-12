if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end
require("user.options")
require("user.colorscheme")
require("user.keymaps")
require("user.netrw")
require("user.icons")
require("user.plugins")
require("user.lsp")
require("user.comment")
require("user.indentline")
require("user.telescope")
require("user.treesitter")
require("user.cmp")
require("user.navic")
require("user.autocommands")
require("user.functions")
require("user.winbar")
require("user.gitsigns")
require("user.lualine")