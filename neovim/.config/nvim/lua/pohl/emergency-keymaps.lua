local opts = { noremap = true, silent = true }

-- Shortcut for function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- General
keymap("n", '<Leader>w', ':w<CR>', opts)
keymap("n", '<Leader><Leader>w', ':wa<CR>', opts)
keymap("n", '<Leader>q', ':q<CR>', opts)
keymap("n", '<Leader><Leader>q', ':qa<CR>', opts)
keymap("n", '<Leader><Tab>', '<C-^>', opts)

-- window editing
keymap("n", '<Leader>by', ':lua require(\'modules.buffer-editing\').copyBuffer()<CR>', opts)
keymap("n", '<Leader>bc', ':lua require(\'modules.buffer-editing\').copyBuffer()<CR>', opts)
keymap("n", '<Leader>bx', ':lua require(\'modules.buffer-editing\').cutBuffer()<CR>', opts)
keymap("n", '<Leader>bp', ':lua require(\'modules.buffer-editing\').pasteBuffer()<CR>', opts)
keymap("n", '<Leader>bu', ':lua require(\'modules.buffer-editing\').undoCloseBuffer()<CR>', opts)
keymap("n", '<Leader><Leader>=', ':wincmd =<CR>', opts)
keymap("n", '<Leader>h', '<C-w>h', opts)
keymap("n", '<Leader>j', '<C-w>j', opts)
keymap("n", '<Leader>k', '<C-w>k', opts)
keymap("n", '<Leader>l', '<C-w>l', opts)
keymap("n", '<Leader>v', '<C-w>v', opts)
keymap("n", '<Leader>s', '<C-w>s', opts)
keymap("n", '<Leader><Leader>h', ':wincmd H<CR>', opts)
keymap("n", '<Leader><Leader>j', ':wincmd J<CR>', opts)
keymap("n", '<Leader><Leader>k', ':wincmd K<CR>', opts)
keymap("n", '<Leader><Leader>l', ':wincmd L<CR>', opts)

-- Tabs
keymap("n", '<Tab>', 'gt', opts)
keymap("n", '<S-Tab>', 'gT', opts)
keymap("n", '<Leader>tn', ':tabnew<CR><cmd>Telescope find_files<CR>', opts)
keymap("n", '<Leader>tq', ':tabclose<CR>', opts)
keymap("n", '<Leader>te', '<C-w>T', opts)
keymap("n", '<Leader>t<', ':tabmove -<CR>', opts)
keymap("n", '<Leader>t>', ':tabmove +<CR>', opts)
keymap("n", '<Leader>t0', ':tabmove 0<CR>', opts)
keymap("n", '<Leader>tv', ':$tabnew<CR>:lcd ' .. vim.fn.stdpath('config') .. '<CR>:LualineRenameTab im config<CR>:Telescope find_files<CR>', opts)
keymap("n", '<Leader>tt', ':tabnew +terminal<CR>:wincmd v<CR>:terminal<CR>:LualineRenameTab  terms<CR><C-\\><C-N>:wincmd h<CR>', opts)

-- Terminals
keymap("n", '<Leader>th', ':wincmd v <CR> :wincmd h <CR>:terminal<CR>', opts)
keymap("n", '<Leader>tj', ':wincmd s <CR>:terminal<CR>', opts)
keymap("n", '<Leader>tk', ':wincmd s <CR> :wincmd k <CR>:terminal<CR>', opts)
keymap("n", '<Leader>tl', ':wincmd v <CR>:terminal<CR>', opts)
keymap("t", ',.', '<C-\\><C-n>', opts)

-- Tag navigation
keymap("n", ']]', '<C-]>mt12jzz`t', opts)
keymap("n", ']t', '<C-]>mt:tabedit %<CR>`t12jzz`tgT<C-t>zzgt', opts)
keymap("n", ']s', ':vsplit<CR><C-]>mt12jzz`t<CR>', opts)
keymap("n", ']S', ':split<CR><C-]>mt12jzz`t<CR>', opts)
keymap("n", '[[', '<C-t>zz', opts)

-- Quickfix list
keymap("n", '<Leader>;', ':cnext<CR>', opts)
keymap("n", '<Leader>,', ':cprevious<CR>', opts)

-- Useful editing stuff
keymap("n", '<Leader>r', ':set invrelativenumber<CR>', opts)
keymap("n", 'Y', 'y$', opts)
keymap("v", 'J', ':m \'>+1<CR>gv=gv', opts)
keymap("v", 'K', ':m \'<-2<CR>gv=gv', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", '$', 'g_', opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- debug remaps
keymap("n", '<Leader>dd', ':make | packadd termdebug | Termdebug<CR><C-w>L<C-w>h<C-w>H<C-w>l<C-w>lifile <Tab><Tab>', opts)
keymap("n", '<Leader>dn', ':Over<CR>', opts)
keymap("n", '<Leader>ds', ':Step<CR>', opts)
keymap("n", '<Leader>dc', ':Continue<CR>', opts)
keymap("n", '<Leader>db', ':Break<CR>', opts)
keymap("n", '<Leader>du', ':Clear<CR>', opts)
keymap("n", '<Leader>dr', ':Run<CR>', opts)

-- Various
keymap("n", '<CR>', '<CR>zz', opts)
keymap("n", '-', '-zz', opts)
