-- [[ Configure and install plugins ]]
require('lazy').setup({
  'NMAC427/guess-indent.nvim',
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
  require 'plugins.telescope-git-file-history',
  require 'plugins.todo-comments',
  require 'plugins.tokyonight',
  require 'plugins.typst',
  require 'plugins.which-key',
  require 'plugins.zk',

  -- require 'plugins.avante',
  -- require 'plugins.debug',
  -- require 'plugins.indent_line',
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
