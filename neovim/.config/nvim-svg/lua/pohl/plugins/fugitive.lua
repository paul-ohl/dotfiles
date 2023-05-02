-- Mappings!
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", '<leader>gs', '<Cmd>Git<CR>', opts)
keymap("n", '<leader>gc', '<Cmd>Git commit<CR>', opts)
keymap("n", '<leader>gp', '<Cmd>Git push<CR>', opts)
keymap("n", '<leader>gh', '<Cmd>diffget //2<CR>', opts)
keymap("n", '<leader>gl', '<Cmd>diffget //3<CR>', opts)
