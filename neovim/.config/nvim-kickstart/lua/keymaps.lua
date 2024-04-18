-- [[ Basic Keymaps ]]

-- Set highlight on search
vim.opt.hlsearch = true
vim.keymap.set('c', '<CR>', '<CR><cmd>nohl<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohl<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<C-;>', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<C-,>', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<C-q>', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Editing keymaps
vim.keymap.set('n', '<Leader>w', ':write<CR>', { desc = 'Write to file' })
vim.keymap.set('n', '<Leader><Leader>w', ':wa<CR>', { desc = 'Write all files' })
vim.keymap.set('n', '<Leader>q', ':quit<CR>', { desc = 'Quit file' })
vim.keymap.set('n', '<Leader><Leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<Leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<Leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<Leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<Leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<Leader>v', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<Leader>s', '<C-w>s', { desc = 'Split window' })
vim.keymap.set('n', '<Leader><Tab>', '<C-^>', { desc = 'Switch to last file' })

-- Tabs
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Go to next Tab' })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Go to previous Tab' })
vim.keymap.set('n', '<Leader><Tab>', '<C-^>', { desc = 'Switch to last file' })
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tq', ':tabclose<CR>')
vim.keymap.set('n', '<leader>te', '<C-w>T')
vim.keymap.set('n', '<leader>t<', ':tabmove -<CR>')
vim.keymap.set('n', '<leader>t>', ':tabmove +<CR>')
vim.keymap.set('n', '<leader>t0', ':tabmove 0<CR>')

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Plugin-specific keymaps
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })

-- vim: ts=2 sts=2 sw=2 et
