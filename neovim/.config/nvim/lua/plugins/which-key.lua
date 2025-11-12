return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      preset = 'helix',
      delay = 0,

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', icon = '' },
        { '<leader>t', group = '[T]abs', icon = '󰓩' },
        { '<leader>u', group = 'Toggles', icon = '' },
        { '<leader>g', group = '[G]it', icon = '' },
        { '<leader>gc', icon = '󱆄' },
        { '<leader>gh', icon = '󰋚' },
        { '<leader>c', group = '[C]ode', icon = '󰅩' },
        { '<leader>co', icon = '' },
        { '<leader>ca', icon = '󱡄' },
        { '<leader>d', icon = '' },
        { '<leader>y', icon = '' },
        { '<leader>Y', icon = '' },
        { '<leader>a', icon = '', desc = 'save to harpoon' },
        { '<leader>sa', icon = '', desc = 'edit harpoon' },
        { '<leader>f', icon = '󰙅' },
        { '<leader>n', hidden = true },
        { '<leader>p', hidden = true },
        { '<leader>,', hidden = true },
        { '<leader>.', hidden = true },
        { '<leader>q', hidden = true },
        { '<leader>w', hidden = true },
        { '<leader>*', icon = '󰈞' },
        { '<leader><leader>', icon = '' },
        { '<leader>o', group = '[O]rg/Zk', icon = '' },
        { '<leader>oi', icon = '', desc = 'open index note' },
        { '<leader>of', icon = '', desc = 'find notes' },
        { '<leader>on', icon = '', desc = 'new note' },
      },

      plugins = {
        marks = false,
        registers = false,
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
        },
      },

      icons = {
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
