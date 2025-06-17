return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      vim.keymap.set('n', '<leader>um', '<Cmd>RenderMarkdown toggle<CR>', { desc = 'Toggle Markdown rendering' })
      require('render-markdown').setup {
        patterns = {
          markdown = {
            disable = true,
            directives = {
              { id = 17, name = 'conceal_lines' },
              { id = 18, name = 'conceal_lines' },
            },
          },
        },
        anti_conceal = {
          -- This enables hiding any added text on the line the cursor is on.
          enabled = true,
          -- Which elements to always show, ignoring anti conceal behavior. Values can either be
          -- booleans to fix the behavior or string lists representing modes where anti conceal
          -- behavior will be ignored. Valid values are:
          --   head_icon, head_background, head_border, code_language, code_background, code_border,
          --   dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
          ignore = {
            code_background = true,
            code_border = false,
            sign = true,
          },
          -- Number of lines above cursor to show.
          above = 0,
          -- Number of lines below cursor to show.
          below = 0,
        },
        heading = {
          position = 'right',
          width = 'full',
        },
      }
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_auto_start = 0 -- Automatically open preview when opening a markdown file
      vim.g.mkdp_refresh_slow = 1 -- Refresh only when exiting insert mode and/or saving the file
      vim.g.mkdp_open_to_the_world = 1 -- Preview is open on 0.0.0.0 and available to other devices on the network
    end,
    ft = { 'markdown' },
  },
}
