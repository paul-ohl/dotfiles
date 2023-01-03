local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>gs", vim.cmd.Git, opts)
vim.keymap.set("n", '<leader>gc', '<Cmd>Git commit<CR>', opts)
vim.keymap.set("n", '<leader>gp', '<Cmd>Git push<CR>', opts)
vim.keymap.set("n", '<leader>gh', '<Cmd>diffget //2<CR>', opts)
vim.keymap.set("n", '<leader>gl', '<Cmd>diffget //3<CR>', opts)

