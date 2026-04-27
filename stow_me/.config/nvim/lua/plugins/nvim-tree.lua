local function my_on_attach(bufnr)
  local api = require 'nvim-tree.api'

  local function local_map(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = bufnr,
      desc = 'nvim-tree: ' .. desc,
      noremap = true,
      silent = true,
      nowait = true,
    })
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  local_map('<Left>', api.node.navigate.parent, 'Go to parent')
  local_map('<Right>', api.node.open.drop, 'Open')
  local_map('s', api.node.open.horizontal, 'Split')
  local_map('v', api.node.open.vertical, 'Split Vertical')
  local_map('t', api.node.open.tab_drop, 'Open in Tab')
  local_map('<C-R>', '<C-W>w', 'Move to the next window')
  local_map('<C-T>', '<C-W>W', 'Move to the previous window')
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- enable 24-bit colour
    vim.opt.termguicolors = true
    vim.keymap.set('n', '<Leader>f', '<Cmd>NvimTreeToggle<CR>', { desc = 'Open [F]ileTree' })
  end,
  config = function()
    require('nvim-tree').setup {
      on_attach = my_on_attach,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      view = {
        centralize_selection = true,
        number = true,
        relativenumber = true,
        signcolumn = 'auto',
      },
      update_focused_file = {
        enable = true,
        update_root = { enable = false },
      },
      filters = {
        enable = true,
        git_ignored = false,
        custom = {
          '.git',
          'node_modules',
          '.cache',
          '.DS_Store',
          'Thumbs.db',
          'target',
          'dist',
          'build',
        },
        exclude = {
          '.gitignore',
          '.env',
          '.env.local',
          '.env.development',
          '.env.production',
          '.env.test',
        },
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
