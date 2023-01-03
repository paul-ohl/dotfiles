" Map key chord `ne` to <Esc> in insert mode
let g:esc_n_lasttime = 0
let g:esc_e_lasttime = 0
function! NEescape(key)
	if a:key=='n' | let g:esc_n_lasttime = reltimefloat(reltime()) | endif
	if a:key=='e' | let g:esc_e_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_n_lasttime - g:esc_e_lasttime)
	return (l:timediff <= 0.07 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction

" Insert mode remap
inoremap <expr> n NEescape('n')
inoremap <expr> e NEescape('e')

" Map key chord `ne` to <C-\><C-n> in terminal mode
let g:esc_n_lasttime = 0
let g:esc_e_lasttime = 0
function! NEescapeTerminal(key)
	if a:key=='n' | let g:esc_n_lasttime = reltimefloat(reltime()) | endif
	if a:key=='e' | let g:esc_e_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_n_lasttime - g:esc_e_lasttime)
    return (l:timediff <= 0.1 && l:timediff >=0.001) ? "\<BS>\<C-\>\<C-N>" : a:key
endfunction
tnoremap <expr> n NEescapeTerminal('n')
tnoremap <expr> e NEescapeTerminal('e')
