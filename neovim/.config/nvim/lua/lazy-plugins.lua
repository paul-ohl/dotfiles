-- [[ Configure and install plugins ]]
require('lazy').setup({
  'psliwka/vim-smoothie',
  { 'kylechui/nvim-surround', opts = {} },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },

  require 'plugins.harpoon',
  require 'plugins.auto-session',
  require 'plugins.lazygit',
  require 'plugins.lsp',
  require 'plugins.markdown',
  require 'plugins.mini',
  require 'plugins.nvim-tree',
  require 'plugins.oil',
  require 'plugins.opencode',
  require 'plugins.telescope',
  require 'plugins.todo-comments',
  require 'plugins.tokyonight',
  require 'plugins.typst',
  require 'plugins.which-key',
  require 'plugins.zk',
}, {
  opts = {
    rocks = {
      enabled = false,
    },
  },
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
