require('telescope').setup{
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<C-s>"] = "select_vertical",
				["<C-i>"] = "select_horizontal",
				["<C-t>"] = "select_tab",
				["<C-h>"] = "which_key",
			},
			n = {
				["s"] = "select_vertical",
				["S"] = "select_horizontal",
				["t"] = "select_tab",
				["q"] = "send_to_qflist",
				["<Esc>"] = "close",
			}
		}
	},
	pickers = {
	},
	extensions = {
		command_palette = {
			{
				"Functions",
				-- { "If you need to end up in insert mode", "Add a 1 after", 1 },
				{ "Toggle ScrollOff", ":call ToggleScrollOff()" },
				{ "Update", ":call Updatr()" },
				{ "Write compile_commands (bear)", ":call Bear()" },
				{ "Write ls to buffer", ":call WriteLs('')" },
				{ "Write srcs to buffer", ":call WriteLs('srcs')"},
				{ "change _ptr to _pointer", ":%s/_ptr/_pointer/g"},
				{ "Switch to corresponding file", ":lua require('functions').editSibling()" }
			}, {
				"Templates",
				{ "Make cpp class", ":call MkClassCPP()" },
			}, {
				"Vim",
				{ "source vimrc", ":source $MYVIMRC" },
				{ 'check health', ":checkhealth" },
				{ "registers", ":lua require('telescope.builtin').registers()" },
				{ "search history", ":lua require('telescope.builtin').search_history()" },
				{ "relative number", ':set relativenumber!' },
				{ "search highlighting (F12)", ':set hlsearch!' },
			}
		}
	}
}

require('telescope').load_extension('command_palette')
