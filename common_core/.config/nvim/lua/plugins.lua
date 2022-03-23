-- 
--     ::::::::   ::::::  :::   ::: :::
--    :+:   :+: :+:  :+: :+:   :+: :+:  Paul OHL
--   +#++++#+  +#+  +:+ +#++:+#++ +#+
--  #+#       #+#  #+# #+#   #+# #+#
-- ###        ######  ###   ### #######
-- 
-- Created: 2021/12/12 18:36:01
-- Description: Contains all the configuration for plugins and plugin manager
-- 

require 'paq' {
	'savq/paq-nvim';				-- Let Paq manage itself
	'b0o/mapx.nvim';				-- Mapping management made easier
	'pbondoer/vim-42header';		-- Header generator for 42
	'popohl/vim-pohl-header';		-- My personal header generator
	'gruvbox-community/gruvbox';	-- Gruvbox, my favorite colorscheme
	'kyazdani42/nvim-tree.lua';		-- File tree
	'tpope/vim-fugitive';			-- Git client straight inside Vim
	'gcmt/taboo.vim';				-- Tab renaming
	'ludovicchabant/vim-gutentags';	-- Tag generation
	'itchyny/lightline.vim';		-- Status line
	-- 'vimwiki/vimwiki';				-- Personal documentation

	-- Telescope
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'LinArcX/telescope-command-palette.nvim';

	-- Conquer of Completion
	{'neoclide/coc.nvim', branch='release'};
	'honza/vim-snippets';			-- snippets for Coc

	'tpope/vim-commentary';			-- Commentaries
	'psliwka/vim-smoothie';			-- Smooth scrolling
}

-- MapX
local mapx = require'mapx'

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
require('plugin_config.nvim_tree')
mapx.nnoremap('<Leader>f', ':NvimTreeToggle<CR>')

-- Vim Fugitive
mapx.nnoremap('<leader>gs', ':Git<CR>')
mapx.nnoremap('<leader>gc', ':Git commit<CR>')
mapx.nnoremap('<leader>gd', ':Gdiffsplit<CR>')
mapx.nnoremap('<leader>gb', ':Git checkout ')
mapx.nnoremap('<leader>gm', ':Git merge')
mapx.nnoremap('<leader>gp', ':!git push<CR>')

-- Taboo
mapx.nnoremap('<Leader>tr', ':TabooRename ')

-- Gutentags
vim.g.gutentags_cache_dir = '~/.config/gutentags_cache_dir/'

-- VimWiki
-- vim.cmd ('source ' .. vim.fn.stdpath('config') .. '/lua/plugin_config/vimwiki.vim')

-- Telescope
mapx.nnoremap('<Leader>ss', ':Telescope<CR>')
mapx.nnoremap('<Leader>sf', ':Telescope find_files<CR>')
mapx.nnoremap('<Leader>sg', ':Telescope live_grep<CR>')
mapx.nnoremap('<Leader>sh', ':Telescope help_tags<CR>')
mapx.nnoremap('<Leader>sq', ':Telescope quickfix<CR>')
mapx.nnoremap('<Leader>sc', ':Telescope command_palette<CR>')
require('plugin_config.telescope')

-- Coc(k)
vim.cmd ('source ' .. vim.fn.stdpath('config') .. '/lua/plugin_config/coc.vim')
