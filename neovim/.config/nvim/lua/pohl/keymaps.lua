local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	print("Cannot load which-key, reverting to emergency remaps")
	require("pohl.emergency-keymaps")
	return
end

local function open_folder(folder_name, open_in_new_tab)
	-- Open a new tab
	if open_in_new_tab then
		vim.cmd('$tabnew')
	end
	local tlscp_file_browser = require("telescope").extensions.file_browser
	tlscp_file_browser.file_browser({
		path = folder_name,
		hidden = true,
		grouped = true,
	})
end

wk.register({
	["<Leader>"] = {
		w = { ':write<CR>', 'Write' },
		R = { ':set invrelativenumber<CR>', 'toggle relative numbers' },
		q = { ':quit<CR>', 'Quit' },
		["<Tab>"] = { '<C-^>', 'Alternate file' },
		h = { '<C-w>h', 'Move Left' },
		j = { '<C-w>j', 'Move Down' },
		k = { '<C-w>k', 'Move Up' },
		l = { '<C-w>l', 'Move Right' },
		v = { '<C-w>v', 'Split Vertically' },
		[';'] = { ':cnext<CR>', 'Next quickfix item' },
		[','] = { ':cprevious<CR>', 'Previous quickfix item' },
		s = {
			name = "Search",
			v = { ':$tabnew<CR>:lcd ' ..
				vim.fn.stdpath('config') .. '<CR>:LualineRenameTab im config<CR>:Telescope find_files<CR>',
				'Search im config' },
			d = { function() open_folder('$HOME/dotfiles/', true) end, 'Browse Dotfiles' },
			b = { function() open_folder(nil) end, 'Browse current folder' },
			f = { function() require('telescope.builtin').find_files() end, 'Find files' },
			h = { function() require('telescope.builtin').help_tags() end, 'Search help' },
			g = { function() require('telescope.builtin').live_grep() end, 'Grep files' },
		},
		b = {
			name = "Buffer",
			y = { ':lua require(\'modules.buffer-editing\').copyBuffer()<CR>', 'Copy buffer' },
			c = { ':lua require(\'modules.buffer-editing\').copyBuffer()<CR>', 'Copy buffer' },
			x = { ':lua require(\'modules.buffer-editing\').cutBuffer()<CR>', 'Cut buffer' },
			p = { ':lua require(\'modules.buffer-editing\').pasteBuffer()<CR>', 'Paste buffer' },
			u = { ':lua require(\'modules.buffer-editing\').undoCloseBuffer()<CR>', 'Restore buffer' },
			r = { ':lua require(\'modules.buffer-editing\').undoCloseBuffer()<CR>', 'Restore buffer' },
			e = {
				name = 'Editing',
				h = { '<cmd>wincmd h<CR><cmd>WhichKey <LT>leader>be<CR>', 'Focus left' },
				j = { '<cmd>wincmd j<CR><cmd>WhichKey <LT>leader>be<CR>', 'Focus down' },
				k = { '<cmd>wincmd k<CR><cmd>WhichKey <LT>leader>be<CR>', 'Focus up' },
				l = { '<cmd>wincmd l<CR><cmd>WhichKey <LT>leader>be<CR>', 'Focus right' },
				H = { '<cmd>wincmd H<CR><cmd>WhichKey <LT>leader>be<CR>', 'Move left' },
				J = { '<cmd>wincmd J<CR><cmd>WhichKey <LT>leader>be<CR>', 'Move down' },
				K = { '<cmd>wincmd K<CR><cmd>WhichKey <LT>leader>be<CR>', 'Move up' },
				L = { '<cmd>wincmd L<CR><cmd>WhichKey <LT>leader>be<CR>', 'Move right' },
			},
		},
		p = {
			name = "Plugins",
			s = { '<Cmd>PackerSync<CR>', 'Synchronise packages' },
			i = { '<Cmd>PackerStatus<CR>', 'Packages status' },
		},
		t = {
			name = "Tabs & Terminals",
			n = { ':tabnew<CR>', 'Open a new tab' },
			q = { ':tabclose<CR>', 'Close tab' },
			e = { '<C-w>T', 'Edit in a new tab' },
			["<"] = { ':tabmove -<CR>', 'Move tab to the left' },
			[">"] = { ':tabmove +<CR>', 'Move tab to the right' },
			["0"] = { ':tabmove 0<CR>', 'Move tab to the beginning' },
			t = { ':tabnew +terminal<CR>:wincmd v<CR>:terminal<CR>:LualineRenameTab  terms<CR>:wincmd h<CR>',
				'Open a tab with terminals' },
			h = { ':wincmd v <CR> :wincmd h <CR>:terminal<CR>', 'Open a terminal on the left' },
			j = { ':wincmd s <CR>:terminal<CR>', 'Open a terminal on the bottom' },
			k = { ':wincmd s <CR> :wincmd k <CR>:terminal<CR>', 'Open a terminal on the top' },
			l = { ':wincmd v <CR>:terminal<CR>', 'Open a terminal on the right' },
		},
		d = {
			name = 'Debug',
			d = { ':make | packadd termdebug | Termdebug<CR><C-w>L<C-w>h<C-w>H<C-w>l<C-w>lifile <Tab><Tab>', 'Start debugger' },
			n = { ':Over<CR>', 'Next' },
			s = { ':Step<CR>', 'Step' },
			c = { ':Continue<CR>', 'Continue' },
			b = { ':Break<CR>', 'Break' },
			u = { ':Clear<CR>', 'Clear' },
			r = { ':Run<CR>', 'Run' },
		},
		["<Leader>"] = {
			name = "Extended actions",
			w = { ':wa<CR>', 'Write all' },
			q = { ':qa<CR>', 'Quit all' },
			["="] = { ':wincmd =<CR>', 'Equalize windows' },
			h = { ':wincmd H<CR>', 'Move buffer left' },
			j = { ':wincmd J<CR>', 'Move buffer down' },
			k = { ':wincmd K<CR>', 'Move buffer up' },
			l = { ':wincmd L<CR>', 'Move buffer right' },
		}
	},
	["]"] = {
		[']'] = { '<Cmd>lua vim.lsp.buf.definition()<CR>mt12jzz`t', 'Go definition' },
		['t'] = { '<Cmd>lua vim.lsp.buf.definition()<CR>mt:tabedit %<CR>`t12jzz`tgT<C-t>zzgt', 'Go definition in new tab' },
		['v'] = { ':vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>mt12jzz`t<CR>', 'Go definition in vertical split' },
		['s'] = { ':split<CR><Cmd>lua vim.lsp.buf.definition()<CR>mt12jzz`t<CR>', 'Go definition in horizontal split' },
	},
	["["] = {
		['['] = { '<C-t>zz', 'go back in tag stack' }
	}
})


-- The rest are remaps that weren't worth putting in which-key
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Tabs
keymap("n", '<Tab>', 'gt', opts)
keymap("n", '<S-Tab>', 'gT', opts)

-- Terminals
-- keymap("t", ',.', '<C-\\><C-n>', opts)

-- Useful editing stuff
keymap("n", 'Y', 'y$', opts)
keymap("v", 'J', ':m \'>+1<CR>gv=gv', opts)
keymap("v", 'K', ':m \'<-2<CR>gv=gv', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", '$', 'g_', opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- Insert mode mappings
keymap("i", "<C-h>", "<Esc><<a", opts)
keymap("i", "<C-l>", "<Esc>>>a", opts)

-- Various
keymap("n", '<C-j>', 'j^zz', opts)
keymap("n", '<C-k>', 'k^zz', opts)
