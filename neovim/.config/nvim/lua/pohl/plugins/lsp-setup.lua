local status_ok, lsp_setup = pcall(require, "nvim-lsp-setup")
if not status_ok then
	print("Cannot load nvim-lsp-setup")
	return
end

lsp_setup.setup({
	default_mappings = false,
	mappings = {
		gD = 'lua vim.lsp.buf.declaration()',
		-- gd = 'lua vim.lsp.buf.definition()',
		gd = 'lua require"telescope.builtin".lsp_definitions()',
		-- gt = 'lua vim.lsp.buf.type_definition()',
		-- gi = 'lua vim.lsp.buf.implementation()',
		gi = 'lua require"telescope.builtin".lsp_implementations()',
		-- gr = 'lua vim.lsp.buf.references()',
		gr = 'lua require"telescope.builtin".lsp_references()',
		K = 'lua vim.lsp.buf.hover()',
		-- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
		['<Leader>cr'] = 'lua vim.lsp.buf.rename()',
		['<space>ca'] = 'lua vim.lsp.buf.code_action()',
		['<space>cf'] = 'lua vim.lsp.buf.formatting()',
		['<space>cd'] = 'lua vim.diagnostic.open_float()',
		['<space>ci'] = 'LspInstallInfo',
		['[d'] = 'lua vim.diagnostic.goto_prev()',
		[']d'] = 'lua vim.diagnostic.goto_next()',
	},
	-- Global on_attach
	on_attach = function(client, _)
		require('nvim-lsp-setup.utils').format_on_save(client)
	end,
	-- Global capabilities
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	-- Configuration of LSP servers
	-- Configurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	servers = {
		pylsp = {},
		ansiblels = {},
		bashls = {},
		sumneko_lua = {
			settings = {
				Lua = {
					runtime = { version = 'LuaJIT', },
					diagnostics = { globals = { 'vim' }, },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = { enable = false, },
				}
			}
		},
		clangd = require('nvim-lsp-setup.clangd_extensions').setup({}),
		volar = {
			init_options = {
				documentFeatures = {
					documentColor = false,
					documentFormatting = false,
				},
			},
			filetypes = { 'typescript', 'javascript', 'javascriptreact',
				'typescriptreact', 'vue', 'json' }
		},
	},
})
