-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<Space>', '<Nop>', { silent = true })

vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Setup utility functions ]]
require 'functions'

-- [[ Setup my autocommands ]]
require 'autocommands'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- vim: ts=2 sts=2 sw=2 et
