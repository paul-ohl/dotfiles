local au = require('modules.autocommand')

au.group('Main', {
	{ -- Auto-source vim config files
		'BufWritePost',
		'*.vim',
		'source % | echo "Sourced!"',
	}, { -- Open images with timg
		'BufEnter',
		'*.jpeg,*.jpg,*.png',
		'terminal timg %',
	}, { -- Save last closed window
		'WinLeave',
		'*',
		'let g:lastWinName = @%',
	},
})
