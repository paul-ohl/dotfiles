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
	-- use 'numToStr/Comment.nvim' -- Easily comment stuff
	use 'nvim-lualine/lualine.nvim' -- replacement for lightline
	use 'tpope/vim-fugitive' -- Git client straight inside Vim
	use 'psliwka/vim-smoothie' -- Smooth scrolling
	use 'lewis6991/impatient.nvim' -- faster startup time
	use 'folke/which-key.nvim' -- keybindings are *fancier*
	use 'vimwiki/vimwiki' -- Wiki inside vim
	use 'glepnir/dashboard-nvim' -- a welcoming dashboard
	use 'tpope/vim-surround' -- Make it easier to handle quotes
	use 'tpope/vim-repeat' -- Make it easier to handle .

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
	use "nvim-telescope/telescope-file-browser.nvim"
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- COC
	use {'neoclide/coc.nvim', branch = 'release'}

	--[[ Neovim completion
	-- LSP
	-- use {
	-- 	'junnplus/nvim-lsp-setup',
		-- requires = {
		-- 	'neovim/nvim-lspconfig',
		-- 	'williamboman/nvim-lsp-installer',
		-- }
	-- }
	-- use 'p00f/clangd_extensions.nvim' -- Additional LSP for C* languages
	-- Treesitter
	use {
        'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
    }
	-- use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- Completion
	-- use 'hrsh7th/nvim-cmp' -- The completion plugin
	-- use 'hrsh7th/cmp-buffer' -- buffer completions
	-- use 'hrsh7th/cmp-path' -- path completions
	-- use 'hrsh7th/cmp-cmdline' -- cmdline completions
	-- use 'saadparwaiz1/cmp_luasnip' -- snippet completions
	-- use 'hrsh7th/cmp-nvim-lsp' -- lsp completions
	-- use 'hrsh7th/cmp-nvim-lua' -- lua vim completions

	-- snippets
	-- use 'L3MON4D3/LuaSnip' --snippet engine
	-- use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use
	]]


	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

-- require('telescope-file-browser').setup()

require('pohl.plugins.which-key')
require('pohl.plugins.nvim_tree')
require('pohl.plugins.lualine')
require('pohl.plugins.telescope')
require('pohl.plugins.dashboard')
require('pohl.plugins.fugitive')
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/pohl/plugins/vimwiki.vim')
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/lua/pohl/plugins/coc.vim')
-- neovim completion
-- require('pohl.plugins.treesitter')
-- require('pohl.plugins.lsp-setup')
-- require('pohl.plugins.cmp')
-- require('pohl.plugins.comment')
