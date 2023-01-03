local crates = require('crates')
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)
vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)
vim.keymap.set('n', '<leader>cc', crates.show_popup, opts)
