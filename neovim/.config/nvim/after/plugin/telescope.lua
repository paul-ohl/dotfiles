local telescope = require('telescope')

local actions = require "telescope.actions"

telescope.setup {
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		-- path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-e>"] = actions.move_selection_previous,
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

				["n"] = actions.move_selection_next,
				["e"] = actions.move_selection_previous,

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
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-i>"] = fb_actions.change_cwd,
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
					["~"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["i"] = fb_actions.change_cwd,
					["b"] = fb_actions.toggle_browser,
					["."] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
				},
			}
		}
	}
}

telescope.load_extension("file_browser")
