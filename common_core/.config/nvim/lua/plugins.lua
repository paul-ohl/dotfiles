--
--     ::::::::   ::::::  :::   ::: :::
--    :+:   :+: :+:  :+: :+:   :+: :+:  Paul OHL
--   +#++++#+  +#+  +:+ +#++:+#++ +#+
--  #+#       #+#  #+# #+#   #+# #+#
-- ###        ######  ###   ### #######
--
-- Created: 2022/03/17 16:38:53
--

require 'paq' {
	'savq/paq-nvim';				-- Let Paq manage itself
	'b0o/mapx.nvim';				-- Mapping management made easier
	'pbondoer/vim-42header';		-- Header generator for 42
	'popohl/vim-pohl-header';		-- My personal header generator
	'gruvbox-community/gruvbox';	-- Gruvbox
	'kyazdani42/nvim-tree.lua';		-- File tree
	 'tpope/vim-fugitive';			-- Git client straight inside Vim
	'ludovicchabant/vim-gutentags';	-- Tag generation
	'kyazdani42/nvim-web-devicons';	-- DevIcons
	'nvim-lualine/lualine.nvim';	-- replacement for lightline
	-- 'vimwiki/vimwiki';			-- Personal documentation
	'metalelf0/nvim-floatedit';		-- Edit a file in floating window
	'tpope/vim-commentary';			-- Commentaries
	'psliwka/vim-smoothie';			-- Smooth scrolling

	-- Telescope
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'LinArcX/telescope-command-palette.nvim';

	-- Conquer of Completion
	{'neoclide/coc.nvim', branch='release'};
	-- 'honza/vim-snippets';		-- snippets for Coc
}

if PaqBootstrap then
	-- Read and install packages
	require('paq').install()
	-- vim.api.nvim_command('let @a = 0')
	-- vim.cmd('autocmd User PaqDoneInstall do something')
	-- print (">>>>>>>>>>> " .. test)
	-- while vim.api.nvim_eval('isPaqInstallFinished') == 0 do
	-- end
end

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
require('plugin_config.nvim_tree')
mapx.nnoremap('<Leader>f', ':NvimTreeToggle<CR>')

-- Vim Fugitive
mapx.nnoremap('<leader>gs', ':Git<CR>')
mapx.nnoremap('<leader>gc', ':Git commit<CR>')
mapx.nnoremap('<leader>gp', ':Git! push<CR>')
-- mapx.nnoremap('<leader>gb', ':Telescope git_branches<CR>')
mapx.nnoremap('<leader>gh', ':diffget //2<CR>')
mapx.nnoremap('<leader>gl', ':diffget //3<CR>')

-- Gutentags
vim.g.gutentags_cache_dir = '~/.config/gutentags_cache_dir/'

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
	lualine_c = {
		{
			'filename',
			path = 1,
			file_status = true,
			symbols = {
				modified = ' ',
				readonly = ' ',
				unnamed = '[No Name]',
			}
		}
	},
    lualine_x = {{'filetype', colored = true, icon_only = false}},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
	  lualine_a = {{'tabs', mode=2}},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {},
	  lualine_y = {'filename'},
	  lualine_z = {'branch'}
  },
  extensions = {}
}
mapx.nnoremap('<Leader>tr', ':LualineRenameTab ')

-- Float edits
mapx.nnoremap('<leader>se', ':Fe ~/dotfiles/README.md<CR>')

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
