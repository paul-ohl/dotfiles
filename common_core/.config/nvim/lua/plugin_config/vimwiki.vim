" Necessary settings
set nocompatible
filetype plugin on
syntax on
let zettlekasten = {}
let zettlekasten.path = '~/Documents/vimwiki/'
let zettlekasten.syntax = 'markdown'
let zettlekasten.ext = '.md'
let zettlekasten.name = 'Zettlekasten'
let zettlekasten.auto_toc = 1
" let zettlekasten.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let zettlekasten.exclude_files = ['**/README.md']
let g:vimwiki_list = [zettlekasten]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_html_header_numbering = 1
let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_auto_header = 1

" Remaps
nmap <Leader>zz <Plug>VimwikiIndex<CR>
nmap <Leader>zt <Plug>VimwikiTabIndex<CR>
nmap <Leader>zs <Plug>VimwikiUISelect<CR>
nmap <Leader>zi <Plug>VimwikiDiaryIndex<CR>
nmap <Leader>zi1 <Plug>VimwikiMakeDiaryNote<CR>
nmap <Leader>zi2 <Plug>VimwikiTabMakeDiaryNote<CR>
nmap <Leader>zi3 <Plug>VimwikiMakeYesterdayDiaryNote<CR>
nmap <Leader>zi4 <Plug>VimwikiMakeTomorrowDiaryNote<CR>
nmap <Leader>zi5 <Plug>VimwikiDiaryGenerateLinks<CR>

" The local remaps are located in ~/.config/nvim/ftplugin/vimwiki.vim
