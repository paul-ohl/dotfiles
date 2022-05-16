local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("Cannot use nvim-lsp-installer!")
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "bashls", "jsonls", "prosemd_lsp" }

lsp_installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("pohl.plugins.lsp.handlers").on_attach,
		capabilities = require("pohl.plugins.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "pohl.plugins.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
