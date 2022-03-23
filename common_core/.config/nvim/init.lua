require "installer"
require "general"
require "remaps"
require "plugins"
require "autocommands"

vim.cmd ('source ' .. vim.fn.stdpath('config') .. '/functions.vim')
