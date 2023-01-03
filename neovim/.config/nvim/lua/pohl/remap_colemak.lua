local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- most important remap for colemak
vim.keymap.set("", 'n', 'j', opts)
vim.keymap.set("", 'N', 'J', opts)
vim.keymap.set("", "e", "k", opts)
vim.keymap.set("", "E", "K", opts)
vim.keymap.set("", "i", "l", opts)
vim.keymap.set("", "I", "e", opts)
vim.keymap.set("", "l", "i", opts)
vim.keymap.set("", "L", "I", opts)
vim.keymap.set("", "k", "nzzzv", opts)
vim.keymap.set("", "K", "Nzzzv", opts)

local function open_folder(folder_path, open_in_new_tab)
	-- Open a new tab
	if open_in_new_tab then
		vim.cmd('$tabnew')
	end
	local tlscp_file_browser = require("telescope").extensions.file_browser
	tlscp_file_browser.file_browser({
		path = folder_path,
		hidden = true,
		grouped = true,
	})
end

local buf_edit = require('modules.buffer-editing')

vim.keymap.set("n", "<Leader>w", ':write<CR>', opts)
vim.keymap.set("n", "<Leader>R", ':set invrelativenumber<CR>', opts)
vim.keymap.set("n", "<Leader>q", ':quit<CR>', opts)
vim.keymap.set("n", "<Leader><Tab>", '<C-^>', opts)
vim.keymap.set("n", "<Leader>h", '<C-w>h', opts)
vim.keymap.set("n", "<Leader>n", '<C-w>j', opts)
vim.keymap.set("n", "<Leader>e", '<C-w>k', opts)
vim.keymap.set("n", "<Leader>i", '<C-w>l', opts)
vim.keymap.set("n", "<Leader>v", '<C-w>v', opts)
vim.keymap.set("n", "<Leader>;", ':cnext<CR>zz', opts)
vim.keymap.set("n", "<Leader>,", ':cprevious<CR>zz', opts)
vim.keymap.set("n", "<C-;>", ':lnext<CR>zz', opts)
vim.keymap.set("n", "<C-,>", ':lprevious<CR>zz', opts)
vim.keymap.set("n", "<Leader>by", function() buf_edit.copyBuffer() end, opts)
vim.keymap.set("n", "<Leader>bc", function() buf_edit.copyBuffer() end, opts)
vim.keymap.set("n", "<Leader>bx", function() buf_edit.cutBuffer() end, opts)
vim.keymap.set("n", "<Leader>bp", function() buf_edit.pasteBuffer() end, opts)
vim.keymap.set("n", "<Leader>bu", function() buf_edit.undoCloseBuffer() end, opts)
vim.keymap.set("n", "<Leader>br", function() buf_edit.undoCloseBuffer() end, opts)
vim.keymap.set("n", "<Leader>tc", ':tabnew<CR>', opts)
vim.keymap.set("n", "<Leader>tq", ':tabclose<CR>', opts)
vim.keymap.set("n", "<Leader>tm", '<C-w>T', opts)
vim.keymap.set("n", "<Leader>t<", ':tabmove -<CR>', opts)
vim.keymap.set("n", "<Leader>t>", ':tabmove +<CR>', opts)
vim.keymap.set("n", "<Leader>t0", ':tabmove 0<CR>', opts)
vim.keymap.set("n", "<Leader>tt", ':tabnew +terminal<CR>', opts)
vim.keymap.set("n", "<Leader>th", ':wincmd v <CR> :wincmd h <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader>tn", ':wincmd s <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader>te", ':wincmd s <CR> :wincmd k <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader>ti", ':wincmd v <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>w", ':wa<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>q", ':qa<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>=", ':wincmd =<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>h", ':wincmd H<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>n", ':wincmd J<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>e", ':wincmd K<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>i", ':wincmd L<CR>', opts)
vim.keymap.set("n", "]]", '<C-]>zz', opts)
vim.keymap.set("n", "]t", '<C-w>v<C-]><C-w>Tzz', opts)
vim.keymap.set("n", "]v", '<C-w>v<C-]>zz', opts)
vim.keymap.set("n", "]s", '<C-w>s<C-]>zz', opts)
vim.keymap.set("n", "[[", '<C-t>zz', opts)

-- Tabs
vim.keymap.set("n", '<Tab>', 'gt', opts)
vim.keymap.set("n", '<S-Tab>', 'gT', opts)

-- Useful editing stuff
vim.keymap.set("n", 'Y', 'y$', opts)
vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", '<Leader>p', '"_dP')
vim.keymap.set("n", '<Leader>y', '"*y')
vim.keymap.set("x", '<Leader>y', '"*y')
vim.keymap.set("n", '<Leader>Y', '"*Y')
vim.keymap.set("n", '<Leader>d', '"_d')
vim.keymap.set("x", '<Leader>d', '"_d')
vim.keymap.set("v", '$', 'g_', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("v", "[[", '<C-t>zz', opts)
vim.keymap.set("n", '<CR>', 'j^zz', opts)
vim.keymap.set("n", '-', 'k^zz', opts)

-- Plugins remaps (Except lsp)
vim.keymap.set("n", "<Leader>ps", vim.cmd.PackerSync)
vim.keymap.set("n", "<Leader>pi", vim.cmd.PackerStatus, opts)
vim.keymap.set("n", "<Leader>pm", vim.cmd.Mason, opts)

local crates = require('crates')
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)
vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)
vim.keymap.set('n', '<leader>cc', crates.show_popup, opts)

vim.keymap.set("n", "<Leader>gs", vim.cmd.Git, opts)
vim.keymap.set("n", '<leader>gc', '<Cmd>Git commit<CR>', opts)
vim.keymap.set("n", '<leader>gp', '<Cmd>Git push<CR>', opts)
vim.keymap.set("n", '<leader>gh', '<Cmd>diffget //2<CR>', opts)
vim.keymap.set("n", '<leader>gi', '<Cmd>diffget //3<CR>', opts)

vim.keymap.set("n", '<Leader>f', "<Cmd>NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<Leader>sv", ':$tabnew<CR>:lcd ' .. vim.fn.stdpath('config') .. '<CR>:Telescope find_files<CR>', opts)
vim.keymap.set("n", "<Leader>sd", function() open_folder(nil) end, opts)
vim.keymap.set("n", "<Leader>st", function() require('telescope.builtin').find_files() end, opts)
vim.keymap.set("n", "<Leader>sh", function() require('telescope.builtin').help_tags() end, opts)
vim.keymap.set("n", "<Leader>sg", function() require('telescope.builtin').live_grep() end, opts)

vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)
