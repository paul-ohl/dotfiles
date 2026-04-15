return {
  'Mathijs-Bakker/godotdev.nvim',
  dependencies = {
    'nvim-treesitter',
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  opts = {
    csharp = true,
  },
  config = function(_, opts)
    require('godotdev').setup(opts)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'cs',
      callback = function()
        vim.opt_local.shiftwidth = 4
      end,
    })
  end,
}
