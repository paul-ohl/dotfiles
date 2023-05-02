local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.setup({
	history = false,
	update_events = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	enable_autosnippets = true,
})

local options = { noremap=true, silent=true }
vim.keymap.set('i', '<C-l>', function () -- Expand or jump forward in snippets
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, options)
vim.keymap.set('i', '<C-h>', function () -- Jump backwards in snippets
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, options)
vim.keymap.set('i', '<C-s>', function ()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, options)

-- Resource snippets
vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/pohl/plugins/snipets.lua<CR>', options)
