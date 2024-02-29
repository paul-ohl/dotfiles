return {
  -- Modified plugins
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs", -- only show tabpages instead
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
    },
  },

  -- Added plugins
  {
    "psliwka/vim-smoothie",
    lazy = false,
  },
  {
    "catppuccin/nvim",
    lazy = false,
  },
  {
    "tpope/vim-abolish/",
    url = "https://tpope.io/vim/abolish.git",
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}
