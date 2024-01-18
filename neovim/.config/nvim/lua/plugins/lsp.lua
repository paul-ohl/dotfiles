return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "]]", vim.lsp.buf.definition }
    keys[#keys + 1] = { "[[", "<c-t>" }
  end,
}
