-- [[ Configure and install plugins ]]
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'psliwka/vim-smoothie',

  { 'kylechui/nvim-surround', opts = {} }, -- Adds surround vim motions
  { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines

  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.colorschemes',
  require 'plugins.copilot',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.nvim-tree',
  require 'plugins.lazygit',

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'spectre_panel', 'markdown' },
      map_c_w = true,
    },
    config = function()
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    config = function()
      require('crates').setup()
    end,
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
