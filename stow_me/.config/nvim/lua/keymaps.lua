-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local function nmap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap or true
  opts.silent = opts.silent or true
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
nmap('n', ']~', function() vim.diagnostic.jump { count = 1 } end, { desc = 'Go to [N]ext diagnostic message' })
nmap('n', '[~', function() vim.diagnostic.jump { count = -1 } end, { desc = 'Go to [P]rev diagnostic message' })
nmap('n', '<Leader>,', '<Cmd>cn<CR>zz', { desc = 'Go to next quickfix item' })
nmap('n', '<Leader>.', '<Cmd>cp<CR>zz', { desc = 'Go to prev quickfix item' })
nmap('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
nmap('n', '[[', '<C-t>', { desc = 'Go back in tag stack' })
nmap('n', ']]', '<Nop>', { silent = true })

-- Editing keymaps
nmap('n', '<Leader>w', ':write<CR>', { desc = 'Write to file' })
nmap('n', '<Leader><Leader>w', ':wa<CR>', { desc = 'Write all files' })
nmap('n', '<Leader>q', ':quit<CR>', { desc = 'Quit file' })
nmap('n', '<Leader><Leader>q', ':qa<CR>', { desc = 'Quit all' })
nmap('n', 'U', '<C-r>')
nmap('i', '<C-h>', '<C-w>') -- Delete the previous word with <C-backspace>
nmap('v', '<Leader>s', ':sort<CR>', { desc = 'Sort selected lines' })

-- Movements
nmap('n', 'zz', 'zz') -- To disable vim smoothie on `zz`
nmap('n', 'zt', 'zt') -- To disable vim smoothie on `zt`
nmap('n', 'zb', 'zb') -- To disable vim smoothie on `zb`
nmap('n', 'n', 'nzzzv')
nmap('n', 'N', 'Nzzzv')
nmap('n', '<Leader>-', '<C-^>', { desc = 'Switch to last file' })
nmap('n', '<C-R>', '<C-W>w', { desc = 'Move to the next window' })
nmap('n', '<C-T>', '<C-W>W', { desc = 'Move to the previous window' })
nmap('n', '<C-Left>', '<C-w>H', { desc = 'Move window to the left' })
nmap('n', '<C-Right>', '<C-w>L', { desc = 'Move window to the right' })
nmap('n', '<C-Down>', '<C-w>J', { desc = 'Move window to the bottom' })
nmap('n', '<C-Up>', '<C-w>K', { desc = 'Move window to the top' })
nmap('n', '<Leader>v', '<C-w>v', { desc = 'Split window vertically' })
nmap({ 'n', 'v' }, '<C-d>', '<cmd>call smoothie#do("<C-D>") <CR>')
nmap({ 'n', 'v' }, '<C-u>', '<cmd>call smoothie#do("<C-U>") <CR>')
nmap({ 'n', 'v', 'o' }, ',', ';') -- This is more comfortable on ergo-l
nmap({ 'n', 'v', 'o' }, ';', ',')
nmap('n', '+', 'j^zz')
nmap('n', '-', 'k^zz')
nmap('v', '<C-Down>', ":m '>+1<CR>gv=gv")
nmap('v', '<C-Up>', ":m '<-2<CR>gv=gv")
nmap('v', '$', 'g_')

-- mark navigation
nmap('n', 'µ', "'m", { desc = 'Go to mark m' })
nmap('n', '_', "'d", { desc = 'Go to mark d' })
nmap('n', ')', "'r", { desc = 'Go to mark r' })
nmap('n', 'î', "'t", { desc = 'Go to mark t' })

-- yanking and deleting to the system clipboard
nmap('n', '<Leader>y', '"+y', { desc = 'copy to clipboard' })
nmap('n', '<Leader>Y', '"+y$', { desc = 'copy to clipboard until end of line' })
nmap('n', '<Leader>d', '"_d', { desc = 'delete to void' })

-- Tabs
nmap('n', '<Tab>', 'gt', { desc = 'Go to next Tab' })
nmap('n', '<S-Tab>', 'gT', { desc = 'Go to previous Tab' })
nmap('n', '<leader>tn', ':tabnew<CR>', { desc = 'Create [N]ew tab' })
nmap('n', '<leader>tq', ':tabclose<CR>', { desc = '[Q]uit tab' })
nmap('n', '<leader>te', '<C-w>T', { desc = '[E]dit in New tab' })
nmap('n', '<leader>t.', ':tabmove -<CR>', { desc = 'Move tab left' })
nmap('n', '<leader>t,', ':tabmove +<CR>', { desc = 'Move tab right' })
nmap('n', '<leader>t0', ':tabmove 0<CR>', { desc = 'Move tab to beginning' })

-- Function to toggle paste mode
vim.g.visual_paste_preserve = false
function ToggleVisualPastePreserve()
  vim.g.visual_paste_preserve = not vim.g.visual_paste_preserve

  if vim.g.visual_paste_preserve then
    vim.keymap.set('x', 'p', '"_dP', { noremap = true, silent = true, desc = 'Paste without yanking' })
    vim.keymap.set('x', 'P', '"_dP', { noremap = true, silent = true, desc = 'Paste without yanking' })
    vim.notify 'Visual Paste Mode: PRESERVE register'
  else
    vim.keymap.set('x', 'p', 'p', { noremap = true, silent = true, desc = 'Default paste' })
    vim.keymap.set('x', 'P', 'P', { noremap = true, silent = true, desc = 'Default paste' })
    vim.notify 'Visual Paste Mode: REPLACE register'
  end
end

-- Toggles with <leader>t
nmap('n', '<Leader>tw', ':tabdo windo set wrap!<CR>', { desc = 'Toggle wrapping' })
nmap('n', '<Leader>tr', ':tabdo windo set relativenumber!<CR>', { desc = 'Toggle relative numbers' })
nmap('n', '<Leader>tv', ToggleVisualPastePreserve, { desc = 'Toggle visual paste preserve' })

-- Diagnostic Config & Keymaps
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float when jumping to error
  jump = { float = true },
}

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- vim: ts=2 sts=2 sw=2 et
