" functions

" netrw 
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

" statusline
function Gitbranch()
    return trim(system("git -C " . expand("%:h") . " branch --show-current 2>/dev/null"))
endfunction

augroup Gitget
    autocmd!
    autocmd BufEnter * let b:git_branch = Gitbranch()
augroup END

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{b:git_branch}
set statusline+=%=\ Ln
set statusline+=\ %l
set statusline+=%=\ Col
set statusline+=\ %c
set statusline+=\ %t
set statusline+=\ %y
set statusline+=\ 
