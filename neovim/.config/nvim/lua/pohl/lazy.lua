-- Bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	'psliwka/vim-smoothie',
	'stevearc/dressing.nvim',
	'nvim-lualine/lualine.nvim', -- Used only for the bottom status bar
	'nvim-lua/popup.nvim',
	'tpope/vim-fugitive',

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'nvim-telescope/telescope-file-browser.nvim',
	{
		'kyazdani42/nvim-tree.lua', -- File tree
		dependencies = {
			'kyazdani42/nvim-web-devicons' -- DevIcons
		}
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		'rose-pine/neovim',
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		'gruvbox-community/gruvbox',
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "bash", "c", "cpp", "go", "html", "javascript", "lua", "query", "rust", "vim",
					"vimdoc", "yaml" },
				auto_install = true,
				sync_install = false,
				highlight = {
					enable = true, additional_vim_regex_highlighting = false
				},
				indent = { enable = true },
			})
		end
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			-- { 'hrsh7th/cmp-path' },
			{'L3MON4D3/LuaSnip'},
			-- { 'rafamadriz/friendly-snippets' },
		}
	},
	-- Completion for Rust's crates
	{
		'saecki/crates.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
	}
})
