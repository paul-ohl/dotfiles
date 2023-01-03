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
	vim.cmd "packadd packer.nvim"
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
	use 'wbthomason/packer.nvim'
	use 'psliwka/vim-smoothie'
	use 'stevearc/dressing.nvim'
	use 'lewis6991/impatient.nvim'
	use 'nvim-lualine/lualine.nvim' -- Used only for the bottom status bar
	use 'nvim-lua/popup.nvim'
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'nvim-telescope/telescope-file-browser.nvim'
	use {
		'kyazdani42/nvim-tree.lua', -- File tree
		requires = {
			{ 'kyazdani42/nvim-web-devicons' }, -- DevIcons
		}
	}
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end
	})
	use {
		'rose-pine/neovim',
		as = 'rose-pine',
	}
	use {
		'gruvbox-community/gruvbox',
		as = 'gruvbox',
	}
	use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	-- Completion for Rust's crates
	use {
		'saecki/crates.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
	}
	use {
		"mfussenegger/nvim-dap",
		requires = { { 'jayp0521/mason-nvim-dap.nvim' } }
	}
end)

vim.keymap.set("n", "<Leader>ps", vim.cmd.PackerSync)
