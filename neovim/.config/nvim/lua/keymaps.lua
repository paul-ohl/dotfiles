-- [[ Basic Keymaps ]]

-- Disable space
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { desc = 'Disable Space' })

-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set('c', '<CR>', '<CR><cmd>nohl<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohl<CR>')
vim.keymap.set('n', '<C-h>', '<C-t>')
vim.keymap.set('n', '<F12>', '<C-]>') -- The hackiest, shittiest solution to a problem that should not exist
vim.keymap.set('n', '<Tab>', ':tabNext<CR>', { desc = 'Go to next Tab', silent = true })

-- Quickfix keymaps
vim.keymap.set('n', '<Leader>;', '<Cmd>cn<CR>zz', { desc = 'Go to next quickfix item' })
vim.keymap.set('n', '<Leader>,', '<Cmd>cp<CR>zz', { desc = 'Go to prev quickfix item' })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', require('custom.goto_error_then_hint').goto_error_then_hint, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[d', function()
  require('custom.goto_error_then_hint').goto_error_then_hint(true)
end, { desc = 'Go to prev [D]iagnostic message' })
vim.keymap.set('n', '[]', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '][', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<C-q>', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Editing keymaps
vim.keymap.set('n', '<Leader>w', ':write<CR>', { desc = 'Write to file' })
vim.keymap.set('n', '<Leader><Leader>w', ':wa<CR>', { desc = 'Write all files' })
vim.keymap.set('n', '<Leader>q', ':quit<CR>', { desc = 'Quit file' })
vim.keymap.set('n', '<Leader><Leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<Leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<Leader>i', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<Leader>n', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<Leader>e', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<Leader>v', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<Leader>s', '<C-w>s', { desc = 'Split window' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set({ 'n', 'v' }, '<C-n>', '<cmd>call smoothie#do("<C-D>") <CR>')
vim.keymap.set({ 'n', 'v' }, '<C-e>', '<cmd>call smoothie#do("<C-U>") <CR>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'zz', 'zz') -- To disable vim smoothie on `zz`
vim.keymap.set('n', 'zt', 'zt') -- To disable vim smoothie on `zt`
vim.keymap.set('n', 'zb', 'zb') -- To disable vim smoothie on `zb`
vim.keymap.set('v', '$', 'g_')
vim.keymap.set('n', '<CR>', 'j^zz')
vim.keymap.set('n', '-', 'k^zz')

vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>Y', '"+y$')
vim.keymap.set('n', '<Leader>d', '"+d')

-- Tabs
vim.keymap.set('n', '<Tab>', ':tabNext<CR>', { desc = 'Go to next Tab', silent = true })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Go to previous Tab' })
vim.keymap.set('n', '<Leader><Tab>', '<C-^>', { desc = 'Switch to last file' })
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>', { silent = true })
vim.keymap.set('n', '<leader>te', '<C-w>T', { silent = true })
vim.keymap.set('n', '<leader>t<', ':tabmove -<CR>', { silent = true })
vim.keymap.set('n', '<leader>t>', ':tabmove +<CR>', { silent = true })
vim.keymap.set('n', '<leader>t0', ':tabmove 0<CR>', { silent = true })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<Leader>f', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- vim: ts=2 sts=2 sw=2 et
