local options = {
	backup = false, -- creates a backup file
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = false, -- Don't leave the search results highlighted
	incsearch = true, -- display the best result while you're typing a search
	errorbells = false, -- no error bells
	ignorecase = true, -- ignore case in search patterns
	mouse = "n", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	-- save undos in ~/.local/share/nvim/undodir/
	undodir = vim.fn.stdpath('data') .. '/undodir',
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program, it is not allowed to be edited
	expandtab = false, -- convert tabs to spaces
	tabstop = 4, -- tabs are 4 space wide
	shiftwidth = 0, -- uses the value of tabstop
	cursorline = false, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	wrap = true, -- break lines
	linebreak = true, -- break lines without cutting words
	scrolloff = 8, -- scroll automatically when you reach the bottom of the buffer
	confirm = true, -- ask for confirmation before quitting an unwritten buffer
	hidden = true, -- allow unwritten buffers to be hidden
	colorcolumn = '80', -- add a column at 80 characters
	signcolumn = "yes", -- always show the sign column
}

local function set_vim_option (key, value)
	vim.opt[key] = value
end

local failed_options = {}
for k, v in pairs(options) do
	if not pcall(set_vim_option, k, v) then
		table.insert(failed_options, k)
	end
end
if #failed_options == 1 then
	print('option ' .. failed_options[1] .. ' failed to be set.')
elseif #failed_options > 1 then
	local output = "options failed: "
	for _, option_name in pairs(failed_options) do
		output = output .. option_name .. ", "
	end
	print(output)
end

vim.opt.shortmess:append "cf"

-- Set Terminal colors if necessary
if vim.fn.has('termguicolors') == 1 then
	vim.opt.termguicolors = true
end
