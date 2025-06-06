-- [[ Configure and install plugins ]]
require('lazy').setup({
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.colorschemes',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.nvim-tree',
  require 'plugins.lazygit',
  require 'plugins.harpoon',
  require 'plugins.smoothie',
  require 'plugins.copilot',
  require 'plugins.markdown',

  'rhysd/conflict-marker.vim',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'projekt0n/github-nvim-theme',
  { 'kylechui/nvim-surround', opts = {} }, -- Adds surround vim motions

  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },

  -- I don't know if I want those...
  -- require 'plugins.debug',
  -- require 'plugins.lint',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
