-- [[ Basic Keymaps ]]

-- Disable space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Disable Space' })

-- Quickfix keymaps
vim.keymap.set('n', '<Leader>,', '<Cmd>cn<CR>zz', { desc = 'Go to next quickfix item' })
vim.keymap.set('n', '<Leader>.', '<Cmd>cp<CR>zz', { desc = 'Go to prev quickfix item' })

-- Diagnostic keymaps
vim.keymap.set('n', '<Leader>n', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<Leader>p', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic message' })
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<C-q>', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '[[', '<C-t>', { desc = 'Go back in tag stack' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- I no longer use terminal mode, but I keep this here just in case I need to get out of it
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Editing keymaps
vim.keymap.set('n', '<Leader>w', ':write<CR>', { desc = 'Write to file' })
vim.keymap.set('n', '<Leader><Leader>w', ':wa<CR>', { desc = 'Write all files' })
vim.keymap.set('n', '<Leader>q', ':quit<CR>', { desc = 'Quit file' })
vim.keymap.set('n', '<Leader><Leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('v', '<S-Down>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<S-Up>', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'zz', 'zz') -- To disable vim smoothie on `zz`
vim.keymap.set('n', 'zt', 'zt') -- To disable vim smoothie on `zt`
vim.keymap.set('n', 'zb', 'zb') -- To disable vim smoothie on `zb`
vim.keymap.set('v', '$', 'g_')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('i', '<C-h>', '<C-w>') -- Delete the previous word with <C-backspace>
vim.keymap.set({ 'n', 'v' }, ',', ';') -- This is more comfortable on ergo-l
vim.keymap.set({ 'n', 'v' }, ';', ',')

-- Window navigation and editing
vim.keymap.set('n', '<Leader><Tab>', '<C-^>', { desc = 'Switch to last file' })
-- vim.keymap.set('n', '<C-I>', '<C-w>l', { desc = 'Move to the window on the right' })
vim.keymap.set('n', '<C-Left>', ':TmuxNavigateLeft<CR>', { desc = 'Move to the window on the left' })
vim.keymap.set('n', '<C-Right>', ':TmuxNavigateRight<CR>', { desc = 'Move to the window on the right' }) -- See kitty config to understand why F13
vim.keymap.set('n', '<C-Down>', ':TmuxNavigateDown<CR>', { desc = 'Move to the window on the bottom' })
vim.keymap.set('n', '<C-Up>', ':TmuxNavigateUp<CR>', { desc = 'Move to the window on the top' })
vim.keymap.set('n', '<C-6>', ':TmuxNavigatePrevious<CR>', { desc = 'Move to the previous window' })
vim.keymap.set('n', '<C-^>', ':TmuxNavigatePrevious<CR>', { desc = 'Move to the previous window' })
vim.keymap.set('n', '<C-S-Left>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-Right>', '<C-w>L', { desc = 'Move window to the right' }) -- See kitty config to understand why F14
vim.keymap.set('n', '<C-S-Down>', '<C-w>J', { desc = 'Move window to the bottom' })
vim.keymap.set('n', '<C-S-Up>', '<C-w>K', { desc = 'Move window to the top' })
vim.keymap.set('n', '<Leader>v', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<Leader>s', '<C-w>s', { desc = 'Split window' })
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<cmd>call smoothie#do("<C-D>") <CR>')
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<cmd>call smoothie#do("<C-U>") <CR>')
vim.keymap.set('n', '<CR>', 'j^zz')
vim.keymap.set('n', '+', 'j^zz')
vim.keymap.set('n', '-', 'k^zz')

-- yanking and deleting
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>Y', '"+y$')
vim.keymap.set('n', '<Leader>d', '"+d')
vim.keymap.set('n', 'x', '"_x') -- Delete without yanking

-- Tabs
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Go to next Tab', silent = true })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Go to previous Tab' })
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', { silent = true })
vim.keymap.set('n', '<leader>te', '<C-w>T', { silent = true })
vim.keymap.set('n', '<leader>t<', ':tabmove -<CR>', { silent = true })
vim.keymap.set('n', '<leader>t>', ':tabmove +<CR>', { silent = true })
vim.keymap.set('n', '<leader>t0', ':tabmove 0<CR>', { silent = true })

-- Toggles with <leader>u
vim.keymap.set('n', '<Leader>uw', ':tabdo windo set wrap!<CR>', { desc = 'Toggle wrapping' })
vim.keymap.set('n', '<Leader>ur', ':tabdo windo set relativenumber!<CR>', { desc = 'Toggle relative numbers' })

vim.keymap.set('n', '<Leader>f', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- vim: ts=2 sts=2 sw=2 et
