"----------------------------------------------------------------
"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"

"----------------------------------------------------------------

" OPTIONS-------------------------------------------------------- 
set clipboard=unnamed,unnamedplus                " enable clipboard
set scrolloff=12
set mouse=a                                      " enable mouse support
set nowrap                                       " disable wrapping
set number                                       " show line numbers
set relativenumber
set term=xterm-256color                          " terminal type
set encoding=utf-8                               " encoding
set showmatch                                    " show matching brackets
set noshowmode
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

" KEYMAPS---------------------------------------------------------
" leader key is comma
let mapleader = ','
" move to first whitespace
nmap 0 ^
" convenient keymaps
nnoremap <leader>a A
nnoremap <leader>i I
" keep selection after indent
vnoremap < <gv
vnoremap > >gv
" move text up and down
xnoremap <C-j> :m '>+1<CR>gv=gv
xnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NETRW------------------------------------------------------------
let g:NetrwIsOpen=0
let g:netrw_banner=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

noremap <leader>e :call ToggleNetrw()<CR>
