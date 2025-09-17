return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      --  Full list: https://github.com/echasnovski/mini.nvim
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- align text
      require('mini.align').setup {}

      require('mini.splitjoin').setup {
        mappings = {
          toggle = 'gs',
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
