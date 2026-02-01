return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>um', '<Cmd>RenderMarkdown toggle<CR>', { desc = 'Toggle Markdown rendering' })

    -- Toggle todo item with Ctrl+Space
    vim.keymap.set('n', '<C-Space>', function()
      local line = vim.api.nvim_get_current_line()
      local new_line

      if line:match '%- %[ %]' then
        -- Unchecked todo -> checked todo
        new_line = line:gsub('%- %[ %]', '- [x]', 1)
      elseif line:match '%- %[[xX]%]' then
        -- Checked todo (x or X) -> unchecked todo
        new_line = line:gsub('%- %[[xX]%]', '- [ ]', 1)
      elseif line:match '^(%s*)[%-%*]%s' then
        -- List item (- or *) -> unchecked todo
        new_line = line:gsub('^(%s*)[%-%*]%s', '%1- [ ] ', 1)
      elseif line:match '%S' then
        -- Non-empty line with no match -> prepend unchecked todo
        local indent = line:match '^(%s*)'
        local content = line:gsub('^%s*', '')
        new_line = indent .. '- [ ] ' .. content
      else
        return
      end

      vim.api.nvim_set_current_line(new_line)
    end, { desc = 'Toggle todo item' })

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
        enabled = true,
        ignore = {
          code_background = true,
          code_border = false,
          sign = true,
          bullet = true,
          checkbox = true,
          dash = true,
          quote = true,
          table_border = true,
          callout = true,
          -- Allow anti-conceal for links and headings
          link = false,
          head_icon = false,
          head_background = false,
          head_border = false,
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
      checkbox = {
        enabled = true,
        unchecked = { icon = ' -  ' },
        checked = { icon = ' -  ' },
      },
      link = {
        enabled = true,
        wiki = { icon = ' ', highlight = 'RenderMarkdownLink' },
        -- web = { icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
      },
    }
  end,
}
