--
--     ::::::::   ::::::  :::   ::: :::
--    :+:   :+: :+:  :+: :+:   :+: :+:  Paul OHL
--   +#++++#+  +#+  +:+ +#++:+#++ +#+
--  #+#       #+#  #+# #+#   #+# #+#
-- ###        ######  ###   ### #######
--
-- Created: 2022/03/17 16:38:53
--

require('paq') {
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
	'chrisbra/csv.vim';				-- Edit csv files

	-- Telescope
	'nvim-lua/popup.nvim';
	'nvim-lua/plenary.nvim';
	'nvim-telescope/telescope.nvim';
	'LinArcX/telescope-command-palette.nvim';

	-- Conquer of Completion
	{'neoclide/coc.nvim', branch='release'};
	-- 'honza/vim-snippets';		-- snippets for Coc
}
