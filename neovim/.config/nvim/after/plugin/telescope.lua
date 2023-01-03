local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

local actions = require "telescope.actions"

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
				["<C-/>"] = actions.which_key,
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
}

-- extensions
local fb_actions = telescope.extensions.file_browser.actions
telescope.setup {
	extensions = {
		file_browser = {
			hidden = true,
			collapse_dirs = true,
			hide_parent_dir = true,
			quiet = true,
			grouped = true,
			mappings = {
				["i"] = {
					["<C-a>"] = fb_actions.create,
					["<S-CR>"] = fb_actions.create_from_prompt,
					["<C-r>"] = fb_actions.rename,
					["<C-m>"] = fb_actions.move,
					["<C-c>"] = fb_actions.copy,
					["<C-x>"] = fb_actions.remove,
					["<C-o>"] = fb_actions.open,
					["<C-h>"] = fb_actions.goto_parent_dir,
					["<C-e>"] = fb_actions.goto_home_dir,
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-l>"] = fb_actions.change_cwd,
					["<C-b>"] = fb_actions.toggle_browser,
					["<C-.>"] = fb_actions.toggle_hidden,
					["<C-s>"] = fb_actions.toggle_all,
				},
				["n"] = {
					["a"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["c"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["h"] = fb_actions.goto_parent_dir,
					["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["l"] = fb_actions.change_cwd,
					["b"] = fb_actions.toggle_browser,
					["."] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
				},
			}
		}
	}
}

telescope.load_extension("file_browser")
