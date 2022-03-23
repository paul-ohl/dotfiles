local au = require('utilities.au')

au.group('Main', {
    { -- Run bear if modified a Makefile
		-- 'BufWritePost',
		-- 'Makefile',
		-- 'call Bear()',
	-- }, { -- Auto-source vim config files
		'BufWritePost',
		'*.vim',
		'source % | echo "Sourced!"',
	}, { -- Auto-source lua config files
		'BufWritePost',
		'*.lua',
		'source % | echo "Sourced!"',
    },
})
