" Map key chord `jk` to <Esc> in insert mode
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.07 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction

" Insert mode remap
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')

" Map key chord `jk` to <C-\><C-n> in terminal mode
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescapeT(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
    return (l:timediff <= 0.1 && l:timediff >=0.001) ? "\<BS>\<C-\>\<C-N>" : a:key
endfunction
tnoremap <expr> j JKescapeT('j')
tnoremap <expr> k JKescapeT('k')
