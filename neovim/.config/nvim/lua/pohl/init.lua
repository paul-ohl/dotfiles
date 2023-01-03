require("pohl.remap_colemak")
require("pohl.packer")
require("pohl.options")

-- better escape with jk without lag
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/vimscript/jk-escape.vim')
