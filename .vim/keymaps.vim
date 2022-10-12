" keymaps 

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
xnoremap <J> :m '>+1<CR>gv=gv
xnoremap <K> :m '<-2<CR>gv=gv
vnoremap <J> :m '>+1<CR>gv=gv
vnoremap <K> :m '<-2<CR>gv=gv

" netrw keymap
noremap <leader>e :call ToggleNetrw()<CR>
