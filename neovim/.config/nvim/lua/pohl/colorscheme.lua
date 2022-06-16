local colorscheme = "kanagawa"

local status_ok, colorscheme_plugin = pcall(require, colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

if colorscheme == "kanagawa" then
	colorscheme_plugin.setup({
		transparent = true,
		dimInactive = false,
	})

end

vim.cmd("colorscheme " .. colorscheme)

vim.cmd [[
	highlight Colorcolumn ctermbg=4
	highlight Normal guibg=None
]]
-- This is for global status bar
-- 	set laststatus=3
-- 	highlight WinSeparator guibg=None
-- ]]
