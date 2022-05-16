-- Mappings!
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", '<leader>se', ':Fe ~/dotfiles/README.md<CR>', opts)
keymap("n", '<leader>sr', ':Fe ./README.md<CR>', opts)
keymap("n", '<leader>st', ':Fe ./TODO.md<CR>', opts)

