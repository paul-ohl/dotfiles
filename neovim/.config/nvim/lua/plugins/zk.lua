return {
  'zk-org/zk-nvim',
  config = function()
    -- global keybindings for zk commands
    local glob_opts = { noremap = true, silent = true }
    local zk_cmds = require 'zk.commands'
    vim.keymap.set('n', '<Leader>oi', function()
      vim.cmd('cd ' .. vim.fn.expand '~/Documents/org/')
      vim.cmd 'e _index.md'
    end, glob_opts)
    vim.keymap.set('n', '<Leader>of', '<cmd>ZkNotes<Cr>', glob_opts)
    vim.keymap.set('n', '<Leader>on', function()
      local title = vim.fn.input 'Title: '
      zk_cmds.get 'ZkNew' { title = title }
    end, glob_opts)

    -- TODO: Org capture-like functionality
    -- TODO: ZkNew with templates
    require('zk').setup {
      picker = 'telescope',
      lsp = {
        -- `config` is passed to `vim.lsp.start(config)`
        config = {
          name = 'zk',
          cmd = { 'zk', 'lsp' },
          filetypes = { 'markdown' },
          on_attach = function(_, bufnr)
            -- see `:h vim.lsp.*` for documentation on any of the below functions
            vim.o.textwidth = 80
            vim.o.shiftwidth = 2

            -- TODO: In the Notes dialog, add the option to insert a link to the current note
            local zk = require 'zk'
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', '<Cr>', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<Leader>sf', '<cmd>ZkNotes<Cr>', opts)
            vim.keymap.set('n', '<Leader>st', function()
              zk.pick_tags({}, {}, function() end)
            end, opts)
            vim.keymap.set('n', '<Leader>ob', '<cmd>ZkBacklinks<Cr>', opts)
            vim.keymap.set('n', '<Leader>oi', '<cmd>ZkInsertLink<Cr>', opts)
          end,
        },
        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
        },
      },
    }
  end,
}
