---@module 'lazy'
---@type LazySpec
return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    ---@module 'which-key'
    ---@type wk.Opts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      preset = 'helix',
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', icon = '' },
        { '<leader>t', group = '[T]ab & [T]oggle', icon = '󰓩' },
        { '<leader>g', icon = '' },
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
        { '<leader>o', group = '[O]pencode/Org/Zk', icon = '󱙺' },
        { '<leader>oa', icon = '󰭻', desc = 'ask opencode' },
        { '<leader>ox', icon = '󱡄', desc = 'execute action' },
        { '<leader>ot', icon = '󱙺', desc = 'toggle opencode' },
        { '<leader>ou', icon = '󰜝', desc = 'scroll up' },
        { '<leader>od', icon = '󰜡', desc = 'scroll down' },
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
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
