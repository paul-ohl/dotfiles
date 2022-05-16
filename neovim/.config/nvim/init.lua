-- No plugins required here
require("pohl.options")
require("pohl.colorscheme")
require("pohl.autocommands")
vim.g.mapleader = " " -- set leader key

-- Plugins required from this point
pcall(require, "impatient") -- This is a plugin to improve startup time
require("pohl.plugins")
require("pohl.keymaps")
