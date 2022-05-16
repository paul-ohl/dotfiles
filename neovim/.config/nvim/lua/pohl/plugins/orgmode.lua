local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	print("Cannot load orgmode")
	return
end
orgmode.setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
		additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
	},
	ensure_installed = {'org'}, -- Or run :TSUpdate org
}

orgmode.setup({
	org_agenda_files = {'~/OneDrive/org/*'},
	org_default_notes_file = '~/OneDrive/org/refile.org',
})
