package_list = {
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

return { package_list = package_list }
