local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<Left>', api.node.navigate.parent, opts 'Go to parent')
  vim.keymap.set('n', '<Right>', api.node.open.drop, opts 'Open')
  vim.keymap.set('n', 's', api.node.open.horizontal, opts 'Split')
  vim.keymap.set('n', 'v', api.node.open.vertical, opts 'Split Vertical')
  vim.keymap.set('n', 't', api.node.open.tab_drop, opts 'Open in Tab')
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      on_attach = my_on_attach,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      view = {
        centralize_selection = true,
        number = true,
        relativenumber = true,
        signcolumn = 'no',
      },
      update_focused_file = {
        update_root = true,
      },
      git = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
    }
  end,
}
