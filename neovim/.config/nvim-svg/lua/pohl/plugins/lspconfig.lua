-- First, we need to setup mason and mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

-- Now, lspconfig configuration
-- Global Mappings.
local options = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>dk', vim.diagnostic.goto_prev, options)
vim.keymap.set('n', '<space>dj', vim.diagnostic.goto_next, options)
vim.keymap.set('n', '<space>dl', "<Cmd>Telescope diagnostics<CR>", options)

-- on\_attach binds the funtion only in lsp-enabled buffer
local on_attach = function(_, bufnr)
	-- Mappings.
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) Most servers don't implement this
	vim.keymap.set('n', ']]', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<space>ci', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wl', function()
	-- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- Individual server configs start here
-- to add a new config, [check out the list](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
-- or `:help lspconfig-all`

-- A default configuration with no customisation
require('lspconfig')['pyright'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- Lua
require('lspconfig')['sumneko_lua'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = true,
			},
		},
	},
}
-- clangd
require('lspconfig')['clangd'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- ansiblels
require('lspconfig')['ansiblels'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- arduino_language_server
require('lspconfig')['arduino_language_server'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- bashls
require('lspconfig')['bashls'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- cmake
require('lspconfig')['cmake'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- cssls
require('lspconfig')['cssls'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- jsonls
require('lspconfig')['jsonls'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- rust_analyzer
require('lspconfig')['rust_analyzer'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- tsserver
require('lspconfig')['tsserver'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
-- html
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig')['html'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true
			},
			provideFormatter = true
		}
	}
}
