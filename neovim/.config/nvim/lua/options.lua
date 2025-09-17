-- [-- [[ Setting options ]]

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab stuff
vim.opt.tabstop = 4

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Wrap lines
vim.opt.wrap = true
vim.opt.linebreak = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 400

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 4

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Disable highlighting of search results
vim.opt.hlsearch = false

-- Default tabsize
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true

-- vim: ts=2 sts=2 sw=2 et
