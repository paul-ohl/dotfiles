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

  -- Added plugins
  {
    "psliwka/vim-smoothie",
    lazy = false,
  },
}
