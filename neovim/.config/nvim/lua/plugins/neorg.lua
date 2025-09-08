return {
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading
    version = '*', -- Pin Neorg to the latest stable release
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.export'] = {
            export_dir = '~/Downloads/',
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/Documents/neorgfiles',
              },
            },
          },
          ['core.completion'] = {
            config = {
              engine = {
                module_name = 'external.lsp-completion',
              },
            },
          },
          ['external.interim-ls'] = {
            config = {
              completion_provider = {
                enable = true,
                documentation = true,

                categories = false,
                people = { enable = false },
              },
            },
          },
        },
      }

      -- Global key mappings for Neorg
      vim.keymap.set('n', '<leader>oo', ':Neorg workspace notes<CR>', { noremap = true, silent = true })

      -- Set up key mappings for interim-ls
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
          end

          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })
    end,
    dependencies = {
      'benlubas/neorg-interim-ls',
    },
  },
}
