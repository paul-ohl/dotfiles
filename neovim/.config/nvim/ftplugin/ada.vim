set makeprg=gnatmake\ %
set errorformat=%f:%l:%c:\ %m,%f:%l:%c:\ %tarning:\ %m,%f:%l:%c:\ (%ttyle)\ %m

nnoremap <buffer> <Leader><CR> :wa <bar> :make<CR>
