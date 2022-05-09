vim.opt.confirm = true -- ask for confirmation before quitting an unwritten buffer
vim.opt.encoding = 'UTF-8'
vim.opt.mouse = '' -- Mouse works everywhere, can be disabled with Shift
vim.opt.hidden = true -- allow unwritten buffers to be hidden
vim.opt.number = true -- Write line numbers
vim.opt.relativenumber = true
vim.opt.hlsearch = false -- Don't leave the search results highlighted
vim.opt.incsearch = true -- display the best result while you're typing a search
vim.opt.errorbells = false -- no error bells
vim.opt.smartindent = true
vim.opt.cmdheight = 2 -- more space for commands
vim.opt.scrolloff = 8 -- Scroll before you reach the limit of the window
vim.opt.showmode = false -- Don't know what it does, but required for lightline
vim.opt.updatetime = 300 -- To set for coc

-- Tabs are 4 spaces wide
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Disable swapfiles and backups to store it in an undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/.undodir/'

-- Split in the direction that I like.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Set Terminal colors if necessary
if vim.fn.has('termguicolors') == 1 then
	vim.opt.termguicolors = true
end

-- Colorcolumn config, colorscheme is set in plugins
vim.opt.colorcolumn = '80'
vim.cmd [[
	syntax on
	highlight Colorcolumn ctermbg=4
	highlight Normal guibg=none
]]
