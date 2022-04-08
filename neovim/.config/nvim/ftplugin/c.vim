nnoremap <buffer> <Leader><CR> :wa <bar> :make<CR>
nnoremap <buffer> <Leader><Leader><CR> :wa <bar> :make re<CR>
set makeprg=make

" Abbreviations
iabbrev <buffer> #i #include
iabbrev <buffer> whiel while
iabbrev <buffer> retunr return
iabbrev <buffer> wii int i;<CR><CR>i = 0;<CR>while (i <)<CR>{<CR>i++;<CR>}<Esc>kkk$i
iabbrev <buffer> pfd printf("%d\n",);<Esc>hi
iabbrev <buffer> pfs printf("%s\n",);<Esc>hi
iabbrev <buffer> pfc printf("%c\n",);<Esc>hi
iabbrev <buffer> pfx printf("%x\n",);<Esc>hi
iabbrev <buffer> pfp printf("%p\n",);<Esc>hi
iabbrev <buffer> ifndefh #ifndef <Esc>:let @"=expand("%:t")<CR>pgUiWf.r_"syiWo#define <Esc>"spo<CR>#endif<Esc>kk0a
