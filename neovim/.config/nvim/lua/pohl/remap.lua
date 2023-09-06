local opts = { noremap = true, silent = true }

-- Leader key is set in pohl/init.lua because of lazy.nvim

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
vim.keymap.set("n", "<Leader>j", '<C-w>j', opts)
vim.keymap.set("n", "<Leader>k", '<C-w>k', opts)
vim.keymap.set("n", "<Leader>l", '<C-w>l', opts)
vim.keymap.set("n", "<Leader>v", '<C-w>v', opts)
vim.keymap.set("n", "<Leader>ss", '<C-w>s', opts)
vim.keymap.set("n", "<Leader>;", ':cnext<CR>zz', opts)
vim.keymap.set("n", "<Leader>,", ':cprevious<CR>zz', opts)
vim.keymap.set("n", "<C-;>", ':lnext<CR>zz', opts)
vim.keymap.set("n", "<C-,>", ':lprevious<CR>zz', opts)
vim.keymap.set("n", "<Leader>sv", ':$tabnew<CR>:lcd ' .. vim.fn.stdpath('config') .. '<CR>:Telescope find_files<CR>',
	opts)
vim.keymap.set("n", "<Leader>sd", function() open_folder(nil) end, opts)
vim.keymap.set("n", "<Leader>sf", function() require('telescope.builtin').find_files() end, opts)
vim.keymap.set("n", "<Leader>sh", function() require('telescope.builtin').help_tags() end, opts)
vim.keymap.set("n", "<Leader>sg", function() require('telescope.builtin').live_grep() end, opts)
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
vim.keymap.set("n", "<Leader>by", function() buf_edit.copyBuffer() end, opts)
vim.keymap.set("n", "<Leader>bc", function() buf_edit.copyBuffer() end, opts)
vim.keymap.set("n", "<Leader>bx", function() buf_edit.cutBuffer() end, opts)
vim.keymap.set("n", "<Leader>bp", function() buf_edit.pasteBuffer() end, opts)
vim.keymap.set("n", "<Leader>bu", function() buf_edit.undoCloseBuffer() end, opts)
vim.keymap.set("n", "<Leader>br", function() buf_edit.undoCloseBuffer() end, opts)
vim.keymap.set("n", "<Leader>ps", ":Lazy sync<CR>", opts)
vim.keymap.set("n", "<Leader>pi", ":Lazy<CR>", opts)
vim.keymap.set("n", "<Leader>pm", vim.cmd.Mason, opts)
vim.keymap.set("n", "<Leader>tn", ':tabnew<CR>', opts)
vim.keymap.set("n", "<Leader>tq", ':tabclose<CR>', opts)
vim.keymap.set("n", "<Leader>te", '<C-w>T', opts)
vim.keymap.set("n", "<Leader>t<", ':tabmove -<CR>', opts)
vim.keymap.set("n", "<Leader>t>", ':tabmove +<CR>', opts)
vim.keymap.set("n", "<Leader>t0", ':tabmove 0<CR>', opts)
vim.keymap.set("n", "<Leader>tt", ':tabnew +terminal<CR>', opts)
vim.keymap.set("n", "<Leader>th", ':wincmd v <CR> :wincmd h <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader>tj", ':wincmd s <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader>tk", ':wincmd s <CR> :wincmd k <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader>tl", ':wincmd v <CR>:terminal<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>w", ':wa<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>q", ':qa<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>=", ':wincmd =<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>h", ':wincmd H<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>j", ':wincmd J<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>k", ':wincmd K<CR>', opts)
vim.keymap.set("n", "<Leader><Leader>l", ':wincmd L<CR>', opts)
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
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", 'n', 'nzzzv', opts)
vim.keymap.set("n", 'N', 'Nzzzv', opts)
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

-- Various
vim.keymap.set("n", '<CR>', 'j^zz', opts)
vim.keymap.set("n", '-', 'k^zz', opts)
