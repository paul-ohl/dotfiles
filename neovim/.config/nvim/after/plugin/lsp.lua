local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer',
	'pyright',
})
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-e>'] = cmp.mapping.select_prev_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'crates' },
	}
})

-- cmp.setup.buffer({ sources = { { name = "crates" } } })

lsp.on_attach(function(_, buffnr)
	local opts = { buffer = buffnr, remap = false }

	vim.keymap.set("n", "]]", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "E", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<Leader>dn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<Leader>de", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<Leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<Leader>r", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
