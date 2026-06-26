return {
  'zbirenbaum/copilot.lua',
  requires = {
    'copilotlsp-nvim/copilot-lsp',
  },
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 15,
        trigger_on_accept = true,
        keymap = {
          accept = '<Tab>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-e>',
          toggle_auto_trigger = false,
        },
      },
    }
  end,
}
