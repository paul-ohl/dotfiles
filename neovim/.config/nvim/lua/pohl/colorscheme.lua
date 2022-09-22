local colorscheme = "gruvbox"

vim.cmd("colorscheme " .. colorscheme)

vim.cmd [[
	highlight Colorcolumn ctermbg=4
	highlight Normal guibg=None
]]
-- This is for global status bar
-- 	set laststatus=3
-- 	highlight WinSeparator guibg=None
-- ]]
