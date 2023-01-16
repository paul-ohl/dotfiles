" Map key chord `,.` to <Esc> in insert mode
let g:esc_a_lasttime = 0
let g:esc_b_lasttime = 0
function! Two_key_escape(key)
	if a:key==',' | let g:esc_a_lasttime = reltimefloat(reltime()) | endif
	if a:key=='.' | let g:esc_b_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_a_lasttime - g:esc_b_lasttime)
	return (l:timediff <= 0.07 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction

" Insert mode remap
inoremap <expr> , Two_key_escape(',')
inoremap <expr> . Two_key_escape('.')

" Map key chord `ne` to <C-\><C-n> in terminal mode
let g:esc_a_lasttime = 0
let g:esc_b_lasttime = 0
function! Two_key_escapeTerminal(key)
	if a:key==',' | let g:esc_a_lasttime = reltimefloat(reltime()) | endif
	if a:key=='.' | let g:esc_b_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_a_lasttime - g:esc_b_lasttime)
    return (l:timediff <= 0.1 && l:timediff >=0.001) ? "\<BS>\<C-\>\<C-N>" : a:key
endfunction
tnoremap <expr> , Two_key_escapeTerminal(',')
tnoremap <expr> . Two_key_escapeTerminal('.')
