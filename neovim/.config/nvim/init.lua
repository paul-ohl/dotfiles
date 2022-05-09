-- Bootstrapping
local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(path)) > 0 then
	print('cloning paq-nvim...')
	vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', path }
	print('Done! Now Bootstrapping')
	vim.fn.system { 'nvim', '--headless', '-u', 'NONE', '-c', 'lua require("utilities.bootstrap").bootstrap_paq()' }
end

require "general"
require "remaps"
require "packages"
require "plugins"
require "autocommands"

vim.cmd ('source ' .. vim.fn.stdpath('config') .. '/functions.vim')
