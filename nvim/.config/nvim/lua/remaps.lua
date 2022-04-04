vim.g.mapleader = ' ' -- Set Leader key

local mapx = require'mapx'

-- Various
mapx.nnoremap('<Leader>u', ':call Updatr()<CR>')

-- Buffer Editing
mapx.nnoremap('<Leader>w', ':w<CR>')
mapx.nnoremap('<Leader><Leader>w', ':wa<CR>')
mapx.nnoremap('<Leader>q', ':q<CR>')
mapx.nnoremap('<Leader><Leader>q', ':qa<CR>')
mapx.nnoremap('<Leader><Tab>', '<C-^>')
mapx.nnoremap('<Leader>bc', ':lua require(\'functions\').copyBuffer()<CR>')
mapx.nnoremap('<Leader>bx', ':lua require(\'functions\').cutBuffer()<CR>')
mapx.nnoremap('<Leader>bp', ':lua require(\'functions\').pasteBuffer()<CR>')
mapx.nnoremap('<Leader>bu', ':lua require(\'functions\').undoCloseBuffer()<CR>')

-- Splits
mapx.nnoremap('<Leader>h', '<C-w>h')
mapx.nnoremap('<Leader>j', '<C-w>j')
mapx.nnoremap('<Leader>k', '<C-w>k')
mapx.nnoremap('<Leader>l', '<C-w>l')
mapx.nnoremap('<Leader>s', '<C-w>v')
mapx.nnoremap('<Leader>S', '<C-w>s')
mapx.nnoremap('<Leader><Leader>h', ':wincmd H<CR>')
mapx.nnoremap('<Leader><Leader>j', ':wincmd J<CR>')
mapx.nnoremap('<Leader><Leader>k', ':wincmd K<CR>')
mapx.nnoremap('<Leader><Leader>l', ':wincmd L<CR>')
mapx.nnoremap('<Leader>=', ':vertical resize +5<CR>')
mapx.nnoremap('<Leader><Leader>=', ':wincmd =<CR>')
mapx.nnoremap('<Leader>-', ':vertical resize -5<CR>')

-- Tabs
mapx.noremap('<Tab>', 'gt:call ToggleScrollOff()<CR>')
mapx.noremap('<S-Tab>', 'gT:call ToggleScrollOff()<CR>')
mapx.nnoremap('<Leader>tn', ':tabnew<CR><cmd>Telescope find_files<CR>')
mapx.nnoremap('<Leader>tq', ':tabclose<CR>')
mapx.nnoremap('<Leader>te', '<C-w>T')
mapx.nnoremap('<Leader>t<', ':tabmove -<CR>')
mapx.nnoremap('<Leader>t>', ':tabmove +<CR>')
mapx.nnoremap('<Leader>t0', ':tabmove 0<CR>')
mapx.nnoremap('<Leader>tv', ':$tabnew<CR>:lcd ' .. vim.fn.stdpath('config') .. '<CR>:LualineRenameTab im config<CR>:Telescope find_files<CR>')
mapx.nnoremap('<Leader>tt', ':tabnew +terminal<CR>:wincmd v<CR>:terminal<CR>:LualineRenameTab  terms<CR><C-\\><C-N>:wincmd h<CR>')

-- Terminals
mapx.nnoremap('<Leader>th', ':wincmd v <CR> :wincmd h <CR>:terminal<CR>')
mapx.nnoremap('<Leader>tj', ':wincmd s <CR>:terminal<CR>')
mapx.nnoremap('<Leader>tk', ':wincmd s <CR> :wincmd k <CR>:terminal<CR>')
mapx.nnoremap('<Leader>tl', ':wincmd v <CR>:terminal<CR>')
mapx.tnoremap(',.', '<C-\\><C-n>')

-- Tag navigation
mapx.nnoremap(']]', '<C-]>mt12jzz`t')
mapx.nnoremap(']t', '<C-]>mt:tabedit %<CR>`t12jzz`tgT<C-t>zzgt')
mapx.nnoremap(']s', ':vsplit<CR><C-]>mt12jzz`t<CR>')
mapx.nnoremap(']S', ':split<CR><C-]>mt12jzz`t<CR>')
mapx.nnoremap('[[', '<C-t>zz')

-- Quickfix list
mapx.nnoremap('<Leader>;', ':cnext<CR>')
mapx.nnoremap('<Leader>,', ':cprevious<CR>')
mapx.nnoremap('<Leader>n', ':write<CR>:cexpr system(\'norvimette \' . shellescape(expand(\'%\')))<CR>') -- Requires the norvimette script
mapx.nnoremap('<Leader><Leader>n', ':write<CR>:cexpr system(\'norvimette .\')<CR>') -- Requires the norvimette script

-- Useful editing stuff
mapx.nnoremap('<Leader>r', ':set invrelativenumber<CR>')
mapx.nnoremap('Y', 'y$')
mapx.nnoremap('H', 'za')
mapx.nnoremap('<BS>', 'cc<Esc>')
mapx.vnoremap('J', ':m \'>+1<CR>gv=gv')
mapx.vnoremap('K', ':m \'<-2<CR>gv=gv')
mapx.vnoremap('$', 'g_')

-- Mappings for lua files
mapx.group('silent', { ft = 'lua' }, function()
	mapx.nnoremap('<Leader><CR>', ':w | so %<CR>')
end)
