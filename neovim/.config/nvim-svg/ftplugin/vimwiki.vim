nmap <buffer> <Leader>odr <Plug>VimwikiDiaryGenerateLinks
nmap <buffer> <Leader>ox <Plug>VimwikiDeleteFile
nmap <buffer> <Leader>or <Plug>VimwikiRenameFile
nmap <buffer> [[ <Plug>VimwikiGoToPrevHeader
nmap <buffer> ]] <Plug>VimwikiGoToNextHeader
nmap <buffer> _ <Plug>VimwikiGoToParentHeader
nnoremap <buffer> <Leader>/ :VimwikiSearch 
nnoremap <buffer> <Leader>; :lnext<CR>
nnoremap <buffer> <Leader>, :lprevious<CR>
nnoremap <buffer> # Go<CR>## <C-R>=strftime("%Hh%M")<CR><CR><CR>

imap <buffer> <C-l> <Plug>VimwikiIncreaseLvlSingleItem
imap <buffer> <C-h> <Plug>VimwikiDecreaseLvlSingleItem

" Insert mode mappings
inoremap <C-h> <Esc><<a
inoremap <C-l> <Esc>>>a

syntax on

" Indents word-wrapped lines as much as the 'parent' line
setlocal textwidth=80
setlocal breakindent
" Ensures word-wrap does not split words

setlocal formatoptions=t
setlocal lbr