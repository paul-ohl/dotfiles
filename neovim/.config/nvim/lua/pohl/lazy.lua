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
	{ 'tpope/vim-fugitive',   cmd = 'Git', },
	{ 'ThePrimeagen/harpoon', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- {{{ Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			plugins = {
				marks = false,
				registers = false,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			key_labels = {
				["<space>"] = "󱁐",
				["<cr>"] = "󰌑",
				["<tab>"] = "󰌒",
			},
			motions = {
				count = true,
			},
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "󰷏",
			},
			popup_mappings = {
				scroll_down = "<c-j>",
				scroll_up = "<c-k>",
			},
			window = {
				border = "shadow", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 5, -- value between 0-100, 0 for fully opaque and 100 for fully transparent
			},
			layout = {
				height = { min = 4, max = 25 },                                      -- min and max height of the columns
				width = { min = 20, max = 50 },                                      -- min and max width of the columns
				spacing = 3,                                                         -- spacing between columns
				align = "left",                                                      -- align columns left, center or right
			},
			ignore_missing = true,                                                   -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
			show_help = true,                                                        -- show a help message in the command line for using WhichKey
			show_keys = true,                                                        -- show the currently pressed key and its label as a message in the command line
			-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
			triggers_nowait = {
				-- spelling
				"z=",
			},
			-- disable the WhichKey popup for certain buf types and file types.
			disable = {
				buftypes = {},
				filetypes = {},
			},
		}
	},
	-- }}}

	-- {{{ Telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-file-browser.nvim',
				cmd = 'Telescope file_browser',
			},
		},
		cmd = 'Telescope',
	},
	-- }}}

	-- {{{ Color schemes
	{
		'rose-pine/neovim',
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		init = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
	},
	{
		'gruvbox-community/gruvbox',
		lazy = true,
	},
	-- }}}

	-- {{{ Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		init = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "bash", "c", "cpp", "gitcommit", "go", "html", "javascript", "lua", "query", "rust",
					"vim", "vimdoc", "yaml" },
				auto_install = true,
				highlight = {
					enable = true, additional_vim_regex_highlighting = false
				},
				indent = { enable = true },
			})
		end
	},
	-- }}}

	-- {{{ LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{
				'hrsh7th/nvim-cmp',
				dependencies = {
					{ 'hrsh7th/cmp-nvim-lsp' },
					{ 'hrsh7th/cmp-path' },
					{ 'hrsh7th/cmp-buffer' },
					{ 'hrsh7th/cmp-nvim-lua' },
					{
						'saecki/crates.nvim',
						event = { "BufRead Cargo.toml" },
						dependencies = { 'nvim-lua/plenary.nvim' },
						config = function()
							require('crates').setup()
						end,
					},
					{
						'L3MON4D3/LuaSnip',
						version = "v2.*",
						build = "make install_jsregexp"
					},
					{ 'rafamadriz/friendly-snippets' },
				},
			},
		},
	},
	-- Helper plugin for ansible
	{
		'pearofducks/ansible-vim',
		lazy = true,
		ft = 'yaml',
	},
	-- }}}

	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{
		'kyazdani42/nvim-tree.lua', -- File tree
		dependencies = {
			'kyazdani42/nvim-web-devicons' -- DevIcons
		},
		cmd = 'NvimTreeToggle',
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		init = function()
			require("nvim-surround").setup({})
		end
	},

	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
})
