return {
  'saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  config = function()
    require('crates').setup {
      lsp = {
        enabled = true,
        on_attach = function(client, bufnr)
          -- the same on_attach function as for your other language servers
          -- can be ommited if you're using the `LspAttach` autocmd
        end,
        actions = true,
        completion = true,
        hover = true,
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
