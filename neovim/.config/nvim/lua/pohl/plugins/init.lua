local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	}
	print 'Installing packer close and reopen Neovim...'
	vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	print('Could not load packer plugin')
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end,
	},
}

packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- Have packer manage itself
	use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	} -- Comments
	use 'nvim-lualine/lualine.nvim' -- replacement for lightline
	use {
		'alvarosevilla95/luatab.nvim', -- Tab line
		requires='kyazdani42/nvim-web-devicons',
		config = function () require('luatab').setup{} end,
	}
	use 'tpope/vim-fugitive' -- Git client straight inside Vim
	use 'psliwka/vim-smoothie' -- Smooth scrolling
	use 'lewis6991/impatient.nvim' -- faster startup time
	use 'folke/which-key.nvim' -- keybindings are *fancier*
	use 'vimwiki/vimwiki' -- Wiki inside vim
	use 'stevearc/dressing.nvim' -- beautiful ui

	-- Colorschemes
	use 'gruvbox-community/gruvbox' -- Gruvbox

	-- side file tree
	use {
		'kyazdani42/nvim-tree.lua', -- File tree
		requires = {
			{ 'kyazdani42/nvim-web-devicons' }, -- DevIcons
		}
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	-- use "AckslD/nvim-neoclip.lua"
	use 'nvim-telescope/telescope-file-browser.nvim'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- nvim-lspconfig
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim' -- Auto installation of LSPs
	use 'williamboman/mason-lspconfig.nvim' -- for better integration with lspconfig

	-- Snipets
	use({ "L3MON4D3/LuaSnip" })

	-- Completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
		}
	}
	use { 'nathangrigg/vim-beancount' }
	use { -- Completion for Rust's crates
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require('crates').setup()
		end,
	}

	-- TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end
	})

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

require('pohl.plugins.which-key')
require('pohl.plugins.nvim_tree')
require('pohl.plugins.lualine')
require('pohl.plugins.telescope')
require('pohl.plugins.fugitive')
require('pohl.plugins.lspconfig')
require('pohl.plugins.cmp')
require('pohl.plugins.snipets')
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/pohl/plugins/vimwiki.vim')
