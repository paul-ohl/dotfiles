return {
  { -- Autocompletion
    'saghen/blink.cmp',
    enable = vim.fn.executable 'nixos-version' == 1, -- Only use if not on NixOS
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        config = function()
          local ls = require 'luasnip'
          -- <C-n> jumps to next placeholder in snippet
          vim.keymap.set({ 'i', 's' }, '<C-n>', function()
            if ls.jumpable(1) then
              ls.jump(1)
            end
          end, { silent = true })
          -- <C-p> jumps to previous placeholder in snippet
          vim.keymap.set({ 'i', 's' }, '<C-p>', function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end, { silent = true })
        end,
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<C-space>'] = { 'show', 'hide' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<C-y>'] = { 'select_and_accept' },
        ['<CR>'] = { 'fallback' }, -- Always insert newline, never accept completion

        -- Tab accepts Blink completion when menu is visible
        ['<Tab>'] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.accept()
            end
          end,
          'fallback',
        },

        -- Snippet navigation only via <C-n>/<C-p>, no menu navigation bindings here
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        menu = {
          -- Prevent snippets from being selected by default
          auto_show = true,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        per_filetype = {
          org = { 'orgmode' },
        },
        providers = {
          lazydev = {
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          path = {
            score_offset = 75,
          },
          lsp = {
            score_offset = 50,
          },
          snippets = {
            score_offset = -100, -- Negative score means snippets appear last, never first
          },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
    init = function()
      local displayFunctionSignature = true
      local function toggleFunctionSignature()
        local cmp = require 'blink.cmp'
        displayFunctionSignature = not displayFunctionSignature
        cmp.setup {
          signature = {
            enabled = displayFunctionSignature,
          },
        }
        local status = displayFunctionSignature and 'ENABLED' or 'DISABLED'
        vim.notify('blink.cmp signature help is now ' .. status)
      end
      vim.keymap.set('n', '<leader>us', toggleFunctionSignature, { desc = 'Toggle function [S]ignature help' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
