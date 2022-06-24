nmap <buffer> <Leader>odr <Plug>VimwikiDiaryGenerateLinks
nmap <buffer> <Leader>ox <Plug>VimwikiDeleteFile
nmap <buffer> <Leader>or <Plug>VimwikiRenameFile
nmap <buffer> [[ <Plug>VimwikiGoToPrevHeader
nmap <buffer> ]] <Plug>VimwikiGoToNextHeader
nmap <buffer> _ <Plug>VimwikiGoToParentHeader
nnoremap <buffer> <Leader>/ :VimwikiSearch 
nnoremap <buffer> <Leader>; :lnext<CR>
nnoremap <buffer> <Leader>, :lprevious<CR>

imap <buffer> <C-l> <Plug>VimwikiIncreaseLvlSingleItem
imap <buffer> <C-h> <Plug>VimwikiDecreaseLvlSingleItem

syntax on
