-- [[ Basic Keymaps ]]

local function nmap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap or true
  opts.silent = opts.silent or true
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Disable space
nmap({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Disable Space', noremap = false })

-- Quickfix keymaps
nmap('n', '<Leader>,', '<Cmd>cn<CR>zz', { desc = 'Go to next quickfix item' })
nmap('n', '<Leader>.', '<Cmd>cp<CR>zz', { desc = 'Go to prev quickfix item' })

-- Diagnostic keymaps
nmap('n', '<Leader>n', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
nmap('n', '<Leader>N', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic message' })
nmap('n', '<Leader>p', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic message' })
nmap('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
nmap('n', '<C-q>', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
nmap('n', ']]', '<Nop>', { desc = 'Disable ]]' })
nmap('n', '[[', '<C-t>', { desc = 'Go back in tag stack' })
nmap('n', 'k', 'K')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- I no longer use terminal mode, but I keep this here just in case I need to get out of it
nmap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Editing keymaps
nmap('n', '<Leader>w', ':write<CR>', { desc = 'Write to file' })
nmap('n', '<Leader><Leader>w', ':wa<CR>', { desc = 'Write all files' })
nmap('n', '<Leader>q', ':quit<CR>', { desc = 'Quit file' })
nmap('n', '<Leader><Leader>q', ':qa<CR>', { desc = 'Quit all' })
nmap('v', '<C-Down>', ":m '>+1<CR>gv=gv")
nmap('v', '<C-Up>', ":m '<-2<CR>gv=gv")
nmap('n', 'n', 'nzzzv')
nmap('n', 'N', 'Nzzzv')
nmap('n', 'zz', 'zz') -- To disable vim smoothie on `zz`
nmap('n', 'zt', 'zt') -- To disable vim smoothie on `zt`
nmap('n', 'zb', 'zb') -- To disable vim smoothie on `zb`
nmap('v', '$', 'g_')
nmap('n', 'U', '<C-r>')
nmap('i', '<C-h>', '<C-w>') -- Delete the previous word with <C-backspace>
nmap({ 'n', 'v' }, ',', ';') -- This is more comfortable on ergo-l
nmap({ 'n', 'v' }, ';', ',')

-- Window navigation and editing
nmap('n', '<Leader><Tab>', '<C-^>', { desc = 'Switch to last file' })
nmap('n', '<Leader>-', '<C-^>', { desc = 'Switch to last file' })
nmap('n', '<C-R>', '<C-W>w', { desc = 'Move to the next window' })
nmap('n', '<C-T>', '<C-W>W', { desc = 'Move to the previous window' })
nmap('n', '<C-S-H>', '<C-w>H', { desc = 'Move window to the left' })
nmap('n', '<C-S-I>', '<C-w>L', { desc = 'Move window to the right' })
nmap('n', '<C-S-R>', '<C-w>J', { desc = 'Move window to the bottom' })
nmap('n', '<C-S-T>', '<C-w>K', { desc = 'Move window to the top' })
nmap('n', '<Leader>v', '<C-w>v', { desc = 'Split window vertically' })
nmap('n', '<Leader>s', '<C-w>s', { desc = 'Split window' })
nmap({ 'n', 'v' }, '<C-d>', '<cmd>call smoothie#do("<C-D>") <CR>')
nmap({ 'n', 'v' }, '<C-u>', '<cmd>call smoothie#do("<C-U>") <CR>')
nmap('n', '<CR>', '<Nop>')
nmap('n', '+', 'j^zz')
nmap('n', '-', 'k^zz')

-- mark navigation
nmap('n', 'µ', "'m", { desc = 'Go to mark m' })
nmap('n', '_', "'d", { desc = 'Go to mark d' })
nmap('n', ')', "'r", { desc = 'Go to mark r' })
nmap('n', 'î', "'t", { desc = 'Go to mark t' })

-- yanking and deleting
nmap('n', '<Leader>y', '"+y')
nmap('n', '<Leader>Y', '"+y$')
nmap('n', '<Leader>d', '"+d')
nmap('n', 'x', '"_x') -- Delete without yanking

-- Tabs
nmap('n', '<Tab>', 'gt', { desc = 'Go to next Tab', silent = true })
nmap('n', '<S-Tab>', 'gT', { desc = 'Go to previous Tab' })
nmap('n', '<leader>tn', ':tabnew<CR>', { silent = true })
nmap('n', '<leader>tq', ':tabclose<CR>', { silent = true })
nmap('n', '<leader>te', '<C-w>T', { silent = true })
nmap('n', '<leader>t.', ':tabmove -<CR>', { silent = true })
nmap('n', '<leader>t,', ':tabmove +<CR>', { silent = true })
nmap('n', '<leader>t0', ':tabmove 0<CR>', { silent = true })

-- Toggles with <leader>u
nmap('n', '<Leader>uw', ':tabdo windo set wrap!<CR>', { desc = 'Toggle wrapping' })
nmap('n', '<Leader>ur', ':tabdo windo set relativenumber!<CR>', { desc = 'Toggle relative numbers' })

nmap('n', '<Leader>f', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- vim: ts=2 sts=2 sw=2 et
