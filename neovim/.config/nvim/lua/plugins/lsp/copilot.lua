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
        panel = {
          enabled = false,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = '<Tab>',
            accept_word = false,
            accept_line = false,
            next = '<C-n>',
            prev = '<C-p>',
            dismiss = '<C-e>',
          },
        },
        filetypes = {
          TelescopePrompt = false,
          cvs = false,
          gitcommit = false,
          gitrebase = false,
          help = false,
          hgcommit = false,
          svn = false,
          ['.'] = false,
        },
        copilot_node_command = 'node',
        server_opts_overrides = {},
      }
    end,
  },
}
