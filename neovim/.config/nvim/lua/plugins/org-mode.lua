return {
  {
    'nvim-orgmode/orgmode',
    -- event = 'VeryLazy',
    opts = {},
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = OrgFolder .. '**/*',
        org_default_notes_file = OrgFolder .. 'refile.org',
        org_todo_keywords = { 'TODO', 'NEXT', 'BLOCKED', 'DOING', '|', 'DONE', 'CANCELED' },
      }

      -- keybinds
      vim.keymap.set('n', '<Leader>oo', '<cmd>OrgIndex<CR>', { desc = 'Open [O]rg index' })
      vim.keymap.set('n', '<Leader>ot', '<cmd>OrgIndexTab<CR>', { desc = 'Open [O]rg index in a [t]ab' })
      vim.keymap.set('n', '<Leader>ov', '<cmd>OrgIndexSplit<CR>', { desc = 'Open [O]rg index in a [v]split' })
    end,
  },
}
