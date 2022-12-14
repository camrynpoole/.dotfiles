local function ToggleNetrw()
	vim.cmd([[
  let g:netrw_banner=0
  let g:NetrwIsOpen=0
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
]])
end

local keymap = vim.keymap.set
local opts = { silent = true }
keymap("n", "<leader>e", ToggleNetrw, opts)
