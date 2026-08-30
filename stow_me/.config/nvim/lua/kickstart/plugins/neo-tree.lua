-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      name = 'window-picker',
      event = 'VeryLazy',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          hint = 'floating-big-letter',
          selection_chars = 'ASENCO',
          picker_config = {
            handle_mouse_click = true,
          },
          show_prompt = false,
        }
      end,
    },
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<C-r>'] = '',
          ['<Right>'] = 'open_with_window_picker',
          -- Focus parent node
          ['<Left>'] = function(state)
            local node = state.tree:get_node()
            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
          end,
          ['<Cr>'] = 'open_with_window_picker',
          ['<Tab>'] = 'toggle_preview',
          ['<C-d>'] = { 'scroll_preview', config = { direction = -10 } },
          ['<C-u>'] = { 'scroll_preview', config = { direction = 10 } },
          ['s'] = 'split_with_window_picker',
          ['v'] = 'vsplit_with_window_picker',
          ['a'] = {
            'add',
            config = {
              show_path = 'relative',
            },
          },
          ['-'] = 'navigate_up',
          ['r'] = 'rename_basename',
          ['R'] = 'rename',
        },
      },
    },
  },
}
