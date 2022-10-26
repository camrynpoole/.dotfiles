" options
set clipboard=unnamed,unnamedplus                " enable clipboard
set scrolloff=12
set mouse=a                                      " enable mouse support
set nowrap                                       " disable wrapping
set number                                       " show line numbers
set relativenumber
set term=xterm-256color                          " terminal type
set encoding=utf-8                               " encoding
set showmatch                                    " show matching brackets
set showmode
set nobackup noswapfile
set autoindent expandtab
set shiftwidth=2 softtabstop=2 tabstop=2
set hlsearch ignorecase incsearch smartcase      " search options
set undofile undodir=~/.vim/undo undolevels=9999 " undo options
set backspace=eol,start,indent                   " configure backspace to act as it should
set wildmenu
set laststatus=2
set shortmess+=c
set shortmess=I
set formatoptions-=cro
set whichwrap+=<,>,h,l

" colorscheme
colorscheme codedark
syntax on
