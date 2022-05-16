local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Could not load packer plugin")
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

packer.startup(function(use)
	use "wbthomason/packer.nvim"	-- Have packer manage itself
	use "nvim-lua/popup.nvim"		-- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim"		-- Useful lua functions used ny lots of plugins
	use "numToStr/Comment.nvim"		-- Easily comment stuff
	use 'nvim-lualine/lualine.nvim'	-- replacement for lightline
	use 'tpope/vim-fugitive'		-- Git client straight inside Vim
	use 'metalelf0/nvim-floatedit'	-- Edit a file in floating window
	use 'tpope/vim-commentary'		-- Commentaries
	use 'psliwka/vim-smoothie'		-- Smooth scrolling
	use 'lewis6991/impatient.nvim'	-- faster startup time
	use 'folke/which-key.nvim'		-- keybindings are *fancier*

	-- Colorschemes
	use "lunarvim/colorschemes"			-- A bunch of colorschemes you can try out
	use "gruvbox-community/gruvbox";	-- Gruvbox

	-- Completion
	use "hrsh7th/nvim-cmp"			-- The completion plugin
	use "hrsh7th/cmp-buffer"		-- buffer completions
	use "hrsh7th/cmp-path"			-- path completions
	use "hrsh7th/cmp-cmdline"		-- cmdline completions
	use "saadparwaiz1/cmp_luasnip"	-- snippet completions
	use "hrsh7th/cmp-nvim-lsp" 		-- lsp completions
	use "hrsh7th/cmp-nvim-lua" 		-- lua vim completions

	-- snippets
	use "L3MON4D3/LuaSnip"				--snippet engine
	use "rafamadriz/friendly-snippets"	-- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig"				-- enable LSP
	use "williamboman/nvim-lsp-installer"	-- simple to use language server installer
	use "tamago324/nlsp-settings.nvim"		-- language server settings defined in json for
	use "jose-elias-alvarez/null-ls.nvim"	-- for formatters and linters

	-- side file tree
	use 'kyazdani42/nvim-tree.lua'		-- File tree
	use 'kyazdani42/nvim-web-devicons'	-- DevIcons

	-- Org-mode in neovim
	use 'nvim-orgmode/orgmode'

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "JoosepAlviste/nvim-ts-context-commentstring"

	-- Fuzzy finder
	use "nvim-telescope/telescope.nvim"
	-- use "nvim-telescope/telescope-media-files.nvim" -- preview images

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

-- Mappings!
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", '<Leader>pu', "<Cmd>PackerSync<CR>", opts)
keymap("n", '<Leader>pi', "<Cmd>PackerStatus<CR>", opts)

require("pohl.plugins.lsp")
require("pohl.plugins.cmp")
require("pohl.plugins.comment")
require("pohl.plugins.floatedits")
require("pohl.plugins.fugitive")
require("pohl.plugins.lualine")
require("pohl.plugins.nvim_tree")
require("pohl.plugins.telescope")
require("pohl.plugins.which-key")
require("pohl.plugins.orgmode")
