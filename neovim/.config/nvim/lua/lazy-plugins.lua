-- [[ Configure and install plugins ]]
require('lazy').setup({
  'NMAC427/guess-indent.nvim',
  'psliwka/vim-smoothie',
  { 'kylechui/nvim-surround', opts = {} },

  require 'plugins.harpoon',
  require 'plugins.lazygit',
  require 'plugins.lsp',
  require 'plugins.mini',
  require 'plugins.neorg',
  require 'plugins.nvim-tree',
  require 'plugins.telescope',
  require 'plugins.todo-comments',
  require 'plugins.tokyonight',
  require 'plugins.which-key',

  -- require 'plugins.debug',
  -- require 'plugins.indent_line',
  -- require 'plugins.lint',
  -- require 'plugins.neo-tree',
  -- require 'plugins.org-mode',
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
