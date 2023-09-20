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

local opts = { noremap = true, silent = true }

require("lazy").setup({
	'psliwka/vim-smoothie',
	'stevearc/dressing.nvim',
	'nvim-lualine/lualine.nvim', -- Used only for the bottom status bar
	'nvim-lua/popup.nvim',

	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set("n", "<Leader>gs", ':Git<CR>', opts)
			vim.keymap.set("n", "<Leader>gp", ':Git push<CR>', opts)
		end
	},
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
		'ThePrimeagen/harpoon',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			vim.keymap.set("n", "<Leader>sm", function() require("harpoon.ui").toggle_quick_menu() end, opts)
			vim.keymap.set("n", "<Leader>m", function() require("harpoon.mark").add_file() end, opts)
			vim.keymap.set({ "n", "t" }, "<C-a>", function() require("harpoon.ui").nav_file(1) end, opts)
			vim.keymap.set({ "n", "t" }, "<C-s>", function() require("harpoon.ui").nav_file(2) end, opts)
			vim.keymap.set({ "n", "t" }, "<C-d>", function() require("harpoon.ui").nav_file(3) end, opts)
			vim.keymap.set({ "n", "t" }, "<C-f>", function() require("harpoon.ui").nav_file(4) end, opts)
			vim.keymap.set("n", "<C-t>", ":lua require('harpoon.term').gotoTerminal(1)<CR>i", opts)
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
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
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function()
			require('Comment').setup()
		end
	},

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			-- { 'hrsh7th/cmp-path' },
			{ 'L3MON4D3/LuaSnip' },
			-- { 'rafamadriz/friendly-snippets' },
		}
	},
	-- Completion for Rust's crates
	{
		'saecki/crates.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		ft = 'toml',
		config = function()
			require('crates').setup()
		end,
	}
})
