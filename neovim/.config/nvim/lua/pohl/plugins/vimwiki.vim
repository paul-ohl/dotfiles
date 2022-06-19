let g:vimwiki_list = [{'path': '~/OneDrive/org/',
					\ 'syntax': 'markdown',
					\ 'ext': '.md',
					\ 'auto_diary_index': 1,
					\ 'links_space_char': '_'}]

let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_dir_link = 'index' " when links point to directories
let g:vimwiki_html_header_numbering = 2
let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_conceal_pre = 0
let g:vimwiki_toc_header = 'Table of Contents'
let g:vimwiki_toc_header_level = 2
let g:vimwiki_map_prefix = '<Leader>o'
let g:vimwiki_auto_chdir = 1
let g:vimwiki_auto_header = 1
let g:vimwiki_listsyms = ' .oOx'
let g:vimwiki_key_mappings = {
				\ 'global': 0,
				\ 'html': 0,
				\ 'mouse': 1,
			\ }
let g:vimwiki_use_calendar = 1

" For local mappings, see ./ftplugin/vimwiki.vim
" Global mappings
nnoremap <Leader>oo :vsplit ~/OneDrive/org/refile.wiki<CR>
nmap <Leader>oi <Plug>VimwikiIndex
nmap <Leader>OI <Plug>VimwikiTabIndex
nmap <Leader>oI <Plug>VimwikiTabIndex
nmap <Leader>ot :edit ~/OneDrive/org/gtd/next_actions.md<CR>
" nmap <Leader>o? <Plug>VimwikiUISelect " If you use multiple wikis
nmap <Leader>odi <Plug>VimwikiDiaryIndex
nmap <Leader>odd <Plug>VimwikiMakeDiaryNote
nmap <Leader>odD <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>oDD <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>ody <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>odt <Plug>VimwikiMakeTomorrowDiaryNote
