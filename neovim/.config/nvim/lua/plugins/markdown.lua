return {
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
        enabled = false,
        ignore = {
          code_background = true,
          code_border = false,
          sign = true,
        },
        above = 0,
        below = 0,
      },
      heading = {
        enabled = true,
        sign = true,
        position = 'inline',
        -- Scaled bullet points for headings
        icons = { '● ', ' ○ ', '  ◆ ', '   ◇  ', '    ▪ ', '     ▫ ' },
        width = 'full',
      },
      bullet = {
        enabled = true,
        -- Distinct list icons using arrows/chevrons
        icons = { '➤', '➜', '▹' },
      },
      link = {
        enabled = true,
        wiki = { icon = ' ', highlight = 'RenderMarkdownLink' },
        -- web = { icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
      },
    }
  end,
}
