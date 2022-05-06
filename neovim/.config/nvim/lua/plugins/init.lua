-- MapX
local mapx = require 'mapx'

-- 42 Header
mapx.nnoremap('<Leader>42', ':Stdheader<CR>')

-- personal Header
mapx.nnoremap('<Leader>43', ':Pohlheader<CR>')

-- Gruvbox
vim.cmd [[
	colorscheme gruvbox
	highlight Normal guibg=none
]]

-- Nvim tree
require('plugins.nvim_tree')
mapx.nnoremap('<Leader>f', ':NvimTreeToggle<CR>')

-- Vim Fugitive
mapx.nnoremap('<leader>gs', ':Git<CR>')
mapx.nnoremap('<leader>gc', ':Git commit<CR>')
mapx.nnoremap('<leader>gp', ':Git push<CR>')
-- mapx.nnoremap('<leader>gb', ':Telescope git_branches<CR>')
mapx.nnoremap('<leader>gh', ':diffget //2<CR>')
mapx.nnoremap('<leader>gl', ':diffget //3<CR>')

-- Gutentags
vim.g.gutentags_cache_dir = '~/.config/gutentags_cache_dir/'

-- Lualine
require('plugins.lualine_cfg')
mapx.nnoremap('<Leader>tr', ':LualineRenameTab ')

-- Float edits
mapx.nnoremap('<leader>se', ':Fe ~/dotfiles/README.md<CR>')
mapx.nnoremap('<leader>sr', ':Fe ./README.md<CR>')
mapx.nnoremap('<leader>st', ':Fe ./TODO.md<CR>')

-- VimWiki
-- vim.cmd ('source ' .. vim.fn.stdpath('config') .. '/lua/plugins/vimwiki.vim')

-- Telescope
mapx.nnoremap('<Leader>ss', ':Telescope<CR>')
mapx.nnoremap('<Leader>sf', ':Telescope find_files<CR>')
mapx.nnoremap('<Leader>sg', ':Telescope live_grep<CR>')
mapx.nnoremap('<Leader>sh', ':Telescope help_tags<CR>')
mapx.nnoremap('<Leader>sq', ':Telescope quickfix<CR>')
mapx.nnoremap('<Leader>sc', ':Telescope command_palette<CR>')
require('plugins.telescope')

-- Coc(k)
vim.cmd ('source ' .. vim.fn.stdpath('config') .. '/lua/plugins/coc.vim')
