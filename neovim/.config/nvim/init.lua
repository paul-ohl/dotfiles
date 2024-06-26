-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
-- This is install and forget.
require 'bootstrap'
-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- [[ Custom functions (See the README for details) ]]
require 'custom'

-- vim: ts=2 sts=2 sw=2 et
