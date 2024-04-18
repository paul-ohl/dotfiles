return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
  },
  {
    'catppuccin/nvim',
    priority = 1000,
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('everforest').setup {
        background = 'hard',
        ui_contrast = 'high',
        transparent_background_level = 1,
        sign_column_background = 'grey',
        italics = true,
        disable_italic_comments = false,
        dim_inactive_windows = true,
        on_highlights = function(hl, _)
          hl['@string.special.symbol.ruby'] = { link = '@field' }
        end,
      }
      require('everforest').load()
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
