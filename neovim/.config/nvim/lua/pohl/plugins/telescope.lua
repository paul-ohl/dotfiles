local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Cannot load telescope")
	return
end

local actions = require "telescope.actions"

-- Mappings!
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", '<Leader>sf', "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", '<Leader>sg', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", 'gR', "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)

telescope.setup {
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		-- path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<Up>"] = actions.move_selection_previous,
				["<Down>"] = actions.move_selection_next,

				["<C-c>"] = actions.close,

				["<CR>"] = actions.select_default,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-/>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["q"] = actions.close,
				["<CR>"] = actions.select_default,
				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["t"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
	},
	extensions = {
	},
}

-- extensions
