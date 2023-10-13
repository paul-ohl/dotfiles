-- Leader key is set in pohl/init.lua because of lazy.nvim

local opts = { noremap = true, silent = true }

local function open_folder_tab(folder_path, telescope_opt)
	telescope_opt = telescope_opt or {}
	vim.cmd('$tabnew')
	vim.cmd('lcd ' .. folder_path)
	require('telescope.builtin').find_files(telescope_opt)
end

local buf_edit = require('modules.buffer-editing')

local wk = require('which-key')
wk.register({
	g = {
		name = "Git",
		s = { ":Git<CR>", "Status" },
		p = { ":Git push ", "Push", silent = false },
		g = { ":Git ", "Any command", silent = false },
		l = { ":Git pull<CR>", "Pull" },
		b = { function() require('telescope.builtin').git_branches() end, "Branches" },
	},
	s = {
		name = "Search",
		v = { function() open_folder_tab(vim.fn.stdpath('config')) end, "Vim dir" },
		d = { function() open_folder_tab("$HOME/dotfiles/", { hidden = true }) end, "Vim dir" },
		f = { function() require('telescope.builtin').find_files() end, "Files" },
		F = { function() require('telescope.builtin').find_files({ hidden = true }) end, "Files" },
		h = { function() require('telescope.builtin').help_tags() end, "Help" },
		g = { function() require('telescope.builtin').live_grep() end, "Grep" },
		b = { "<cmd>Telescope file_browser<CR>", "Grep" },
		m = { function() require("harpoon.ui").toggle_quick_menu() end, "Harpoon Marks" },
	},
	b = {
		name = "BuffEdit",
		y = { function() buf_edit.copyBuffer() end, "Copy" },
		c = { function() buf_edit.copyBuffer() end, "Copy" },
		x = { function() buf_edit.cutBuffer() end, "Cut" },
		p = { function() buf_edit.pasteBuffer() end, "Paste" },
		u = { function() buf_edit.undoCloseBuffer() end, "UndoClose" },
		r = { function() buf_edit.undoCloseBuffer() end, "UndoClose" },
	},
	p = {
		name = "Packages",
		s = { "<cmd>Lazy sync<CR>", "Sync" },
		i = { "<cmd>Lazy<CR>", "Info" },
		m = { vim.cmd.Mason, "Mason" },
	},
	m = { function() require("harpoon.mark").add_file() end, "Mark file" },
	R = { ":set invrelativenumber<CR>", "Relative" },
	f = { "<cmd>NvimTreeToggle<CR>", "Open Tree" },
}, { prefix = "<Leader>" })

-- Basic stuff that does not need documentation
wk.register({
	w = { ":write<CR>", "which_key_ignore" },
	q = { ":quit<CR>", "which_key_ignore" },
	["<Tab>"] = { '<C-^>', "which_key_ignore" },
	h = { "<C-w>h", "which_key_ignore" },
	j = { "<C-w>j", "which_key_ignore" },
	k = { "<C-w>k", "which_key_ignore" },
	l = { "<C-w>l", "which_key_ignore" },
	v = { "<C-w>v", "which_key_ignore" },
	["ss"] = { "<C-w>s", "which_key_ignore" },
	[";"] = { ":cnext<CR>zz", "which_key_ignore" },
	[","] = { ":cprevious<CR>zz", "which_key_ignore" },
	t = {
		name = "which_key_ignore",
		n = { ':tabnew<CR>', "which_key_ignore" },
		q = { ':tabclose<CR>', "which_key_ignore" },
		e = { '<C-w>T', "which_key_ignore" },
		["<"] = { ':tabmove -<CR>', "which_key_ignore" },
		[">"] = { ':tabmove +<CR>', "which_key_ignore" },
		["0"] = { ':tabmove 0<CR>', "which_key_ignore" },
		t = { ':tabnew +terminal<CR>', "which_key_ignore" },
		h = { ':wincmd v <CR> :wincmd h <CR>:terminal<CR>', "which_key_ignore" },
		j = { ':wincmd s <CR>:terminal<CR>', "which_key_ignore" },
		k = { ':wincmd s <CR> :wincmd k <CR>:terminal<CR>', "which_key_ignore" },
		l = { ':wincmd v <CR>:terminal<CR>', "which_key_ignore" },
	},
	["<Leader>"] = {
		name = "which_key_ignore",
		w = { ":wa<CR>", "which_key_ignore" },
		q = { ":qa<CR>", "which_key_ignore" },
		["="] = { ":wincmd =<CR>", "which_key_ignore" },
		h = { ":wincmd H<CR>", "which_key_ignore" },
		j = { ":wincmd J<CR>", "which_key_ignore" },
		k = { ":wincmd K<CR>", "which_key_ignore" },
		l = { ":wincmd L<CR>", "which_key_ignore" },
	}
}, { prefix = "<Leader>" })


-- Simpler remaps that don't benefit from using which-key
vim.keymap.set("n", "]]", '<C-]>zz', opts)
vim.keymap.set("n", "]t", '<C-w>v<C-]><C-w>Tzz', opts)
vim.keymap.set("n", "]v", '<C-w>v<C-]>zz', opts)
vim.keymap.set("n", "]s", '<C-w>s<C-]>zz', opts)
vim.keymap.set("n", "[[", '<C-t>zz', opts)
vim.keymap.set("v", "[[", '<C-t>zz', opts)

vim.keymap.set("n", "<C-j>", ':call smoothie#do("<C-D>")<CR>', opts)
vim.keymap.set("n", "<C-k>", ':call smoothie#upwards()<CR>', opts)

vim.keymap.set("n", '<Tab>', 'gt', opts)
vim.keymap.set("n", '<S-Tab>', 'gT', opts)
vim.keymap.set("n", '<CR>', 'j^zz', opts)
vim.keymap.set("n", '-', 'k^zz', opts)
vim.keymap.set("n", 'Y', 'y$', { silent = true })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", 'n', 'nzzzv', opts)
vim.keymap.set("n", 'N', 'Nzzzv', opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", '$', 'g_', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "p", '"_dp', opts)

vim.keymap.set("x", '<Leader>p', '"_dP')
vim.keymap.set("n", '<Leader>d', '"_d')
vim.keymap.set("x", '<Leader>d', '"_d')

-- OS dependent stuff
if vim.fn.has('unix') then
	vim.keymap.set("n", '<Leader>y', '"+y')
	vim.keymap.set("x", '<Leader>y', '"+y')
	vim.keymap.set("n", '<Leader>Y', '"+y$')
elseif vim.fn.has('macunix') then
	vim.keymap.set("n", '<Leader>y', '"*y')
	vim.keymap.set("x", '<Leader>y', '"*y')
	vim.keymap.set("n", '<Leader>Y', '"*y$')
end

-- Harpoon remaps
vim.keymap.set({ "n", "t" }, "<C-a>", function() require("harpoon.ui").nav_file(1) end, opts)
vim.keymap.set({ "n", "t" }, "<C-s>", function() require("harpoon.ui").nav_file(2) end, opts)
vim.keymap.set({ "n", "t" }, "<C-d>", function() require("harpoon.ui").nav_file(3) end, opts)
vim.keymap.set({ "n", "t" }, "<C-f>", function() require("harpoon.ui").nav_file(4) end, opts)
vim.keymap.set("n", "<C-t>", ":lua require('harpoon.term').gotoTerminal(1)<CR>i", opts)

-- Lsp remaps are in the lsp config file
