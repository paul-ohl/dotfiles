require("pohl.packer")
require("pohl.options")
require("pohl.remap_colemak")

-- better escape with jk without lag
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/vimscript/jk-escape.vim')
