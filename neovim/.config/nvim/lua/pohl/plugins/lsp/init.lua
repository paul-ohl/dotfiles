local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("Cannot use lsp-config plugin!")
	return
end

require("pohl.plugins.lsp.configs")
require("pohl.plugins.lsp.handlers").setup()
require("pohl.plugins.lsp.null-ls")
