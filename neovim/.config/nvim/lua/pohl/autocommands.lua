local au = require('modules.autocommand')

au.group('Main', {
	{ -- Auto-source vim config files
		'BufWritePost',
		'*.vim',
		'source % | echo "Sourced!"',
	}, { -- Auto-source lua config files TODO: only source if in the right folder
		'BufWritePost',
		'*.lua',
		'source % | echo "Sourced!"',
	}, { -- Save last closed window
		'WinLeave',
		'*',
		'let g:lastWinName = @%',
    },
})
