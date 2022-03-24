" Helper function to create a class quickly
function! MkClassCPP()
	let l:filename = expand("%:t:r")
	execute 'read ~/.config/nvim/templates/orthodox_class.hpp'
	execute '%s/\[ClassName\]/' . l:filename . '/g'
	" execute 'FortyTwoHeader'
	execute 'let @a=expand("%:t")'
	execute "normal! gg/\\v\\[CLASS_NAME\\]\<CR>D\"apgUiWf.r_\"ayiWnD\"ap"
	execute 'vnew | read ~/.config/nvim/templates/orthodox_class.cpp'
	normal! ggdd
	execute '%s/\[ClassName\]/' . l:filename . '/g'
	if isdirectory("srcs/")
		let l:save_location = 'srcs/' . l:filename . '.cpp'
	else
		call inputsave()
		let l:save_location = input('Where will you save ' . l:filename . '.cpp? (path only, filename will be completed)')
		call inputrestore()
		let l:save_location = l:save_location . l:filename . '.cpp'
	endif
	execute 'write ' . l:save_location
	" execute 'FortyTwoHeader'
	execute 'wall'
endfunction

" turns off scolloff if entering a terminal window, turns it back on in any
" other buffer
function! ToggleScrollOff()
	if &buftype == 'terminal'
		set scrolloff=0
	else
		set scrolloff=8
	endif
endfunction

" updates my nvim package managers
function! Updatr()
	vsplit __Updatr__
    normal! ggdG
    setlocal filetype=updatr
    setlocal buftype=nofile
	execute 'PaqSync'
	execute 'CocUpdateSync'
endfunction

" Check if a Makefile is present and runs bear -- make to create
" compile_commands.json for coc
function! Bear()
	let l:is_makefile_present = system("if [ -f 'Makefile' ]; then echo 1; else echo 0; fi")
	if l:is_makefile_present
		execute 'silent !bear -- make'
	else
		echo "No Makefile in cwd"
	endif
endfunction

" write all files from a chosen directory to buffer
function! WriteLs(chosen_directory)
	let l:directory = ''
	if a:chosen_directory == ''
		call inputsave()
		let l:directory = input('Which directory: ', '', 'dir')
		call inputrestore()
		redraw
	else
		let l:directory = a:chosen_directory
	endif
	let l:files = split(system('find ' . l:directory . ' -type f | sed "s/srcs\///g" | sort'))
	" format them beautifully
	let l:offset = 0
	for filename in l:files
		let l:curr_line = line('.') + l:offset
		let l:failed = setline(l:curr_line, getline(l:curr_line) . ' ' . filename)
		if strdisplaywidth(getline(l:curr_line)) + strlen(filename) + 2 >= 80
			let l:failed = setline(l:curr_line, getline(l:curr_line) . ' \')
			let l:failed = append(l:curr_line, '		 ')
			let l:offset = l:offset + 1
		endif
	endfor
endfunction

" Open a file which name is the current word
function! EditFileUnderCursor()
	let l:wordUnderCursor = expand("<cfile>")
	" echo l:wordUnderCursor
	execute 'vsplit ' . l:wordUnderCursor
endfunction
