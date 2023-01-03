local function copyBuffer()
	BufferClipboard = vim.api.nvim_get_current_buf()
	print('Copied buffer (' .. BufferClipboard .. ')')
end

local function cutBuffer()
	BufferClipboard = vim.api.nvim_get_current_buf()
	print('Cut buffer (' .. BufferClipboard .. ')')
	vim.api.nvim_win_close(0, false)
end

local function pasteBuffer()
	-- print('Pasting buffer ' .. BufferClipboard)
	if BufferClipboard == nil then
		print('No buffer in clipboard')
	else
		print('Pasted buffer (' .. BufferClipboard .. ')')
		vim.api.nvim_exec('sbuffer ' .. BufferClipboard, false)
	end
end

local au = require('modules.autocommand')

au.group('BufferEditing', {
	{ -- Save last closed window
		'WinLeave',
		'*',
		'let g:lastWinName = @%',
	},
})

local function undoCloseBuffer()
  vim.api.nvim_exec('vsplit ' .. vim.api.nvim_get_var('lastWinName'), false)
end

return {
	copyBuffer = copyBuffer,
	cutBuffer = cutBuffer,
	pasteBuffer = pasteBuffer,
	undoCloseBuffer = undoCloseBuffer,
}
