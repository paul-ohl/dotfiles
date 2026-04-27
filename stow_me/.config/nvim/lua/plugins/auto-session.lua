return {
  'rmagatti/auto-session',
  lazy = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    -- { '<leader>wr', '<cmd>SessionRestore<cr>', desc = 'Restore session' },
    -- { '<leader>ws', '<cmd>SessionSave<cr>', desc = 'Save session' },
    -- { '<leader>wa', '<cmd>Autosession search<cr>', desc = 'Search sessions' },
  },
  opts = {
    auto_restore_enabled = true,
    auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
    post_restore_cmds = {
      function()
        -- Ensure nvim-tree is closed on restore if it was open (cleaner)
        local api = require 'nvim-tree.api'
        api.tree.close()
      end,
    },
  },
}
