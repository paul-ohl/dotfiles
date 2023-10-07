local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'intelephense',
	'taplo',
})
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'crates' },
	}
})

-- Documentation super mapping
local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ 'vim', 'help' }, filetype) then
		vim.cmd('h ' .. vim.fn.expand('<cword>'))
	elseif vim.tbl_contains({ 'man' }, filetype) then
		vim.cmd('Man ' .. vim.fn.expand('<cword>'))
	elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
		require('crates').show_popup()
	else
		vim.lsp.buf.hover()
	end
end

lsp.on_attach(function(_, buffnr)
	lsp.buffer_autoformat()

	local opts = { buffer = buffnr, remap = false }
	vim.keymap.set("n", "]]", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set({ "v", "n" }, "[[", '<C-t>zz', opts)
	vim.keymap.set('n', 'K', show_documentation, opts)
	require('which-key').register({
		d = {
			name = "Lsp",
			a = { function() vim.lsp.buf.code_action() end, "Code Action" },
			j = { function() vim.diagnostic.goto_next() end, "Next" },
			k = { function() vim.diagnostic.goto_prev() end, "Previous" },
			f = { ":LspZeroFormat<CR>", "Format document" },
		},
		r = { function() vim.lsp.buf.rename() end, "Rename" },
	}, { buffer = buffnr, prefix = "<Leader>" })
end)

lsp.format_on_save({
	servers = {
		['lua_ls'] = { 'lua' },
		['rust_analyzer'] = { 'rust' },
	}
})

lsp.setup()
