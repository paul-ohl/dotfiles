return {
  { -- Copilot completion
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      vim.keymap.set('n', '<Leader>ua', function()
        require('copilot.suggestion').toggle_auto_trigger()
      end, { desc = 'Toggle AI autocompletion' })

      require('copilot').setup {
        panel = { enabled = false },
        suggestion = {
          enabled = false,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = '<c-y>',
            accept_word = false,
            accept_line = false,
            next = '<C-a>',
            prev = '<C-u>',
            dismiss = '<C-e>',
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          TelescopePrompt = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ['.'] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      }
    end,
  },
}
