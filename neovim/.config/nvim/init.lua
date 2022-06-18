-- No plugins required here
require("pohl.options")
require("pohl.colorscheme")
require("pohl.autocommands")
vim.g.mapleader = " " -- set leader key

-- better escape with jk without lag
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/vimscript/jk-escape.vim')

-- Plugins required from this point
pcall(require, "impatient") -- This is a plugin to improve startup time
require("pohl.plugins")
require("pohl.keymaps")
