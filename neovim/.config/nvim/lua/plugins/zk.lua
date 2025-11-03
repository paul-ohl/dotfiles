return {
  'zk-org/zk-nvim',
  config = function()
    require('zk').setup {
      -- Can be "telescope", "fzf", "fzf_lua", "minipick", "snacks_picker",
      -- or select" (`vim.ui.select`).
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

            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', '<Cr>', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
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
