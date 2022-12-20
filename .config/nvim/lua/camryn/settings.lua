vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.guicursor = "" -- stop cursor from changing shapes

vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.timeoutlen = 600 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 100 -- faster completion (4000ms default)
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.scrolloff = 12 -- is one of my fav
vim.opt.sidescrolloff = 12

vim.opt.hlsearch = false -- highlight all matches on previous search pattern
vim.opt.incsearch = true -- show matches while typing
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.wildignorecase = true
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.undofile = true -- enable persistent undo
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.number = true -- set numbered lines

vim.opt.showmode = false
vim.opt.swapfile = false -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = false -- highlight the current line
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.wrap = false -- display lines as one long line
vim.opt.list = false
vim.opt.backup = false -- creates a backup file
