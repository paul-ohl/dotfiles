local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("Could not load nvim_tree plugin")
  return
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

-- Mappings!
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", '<Leader>f', "<Cmd>NvimTreeToggle<CR>", opts)

nvim_tree.setup {
	hijack_cursor	= true,
	update_cwd		= false,
	diagnostics = {
		enable = true,
		icons = {
			hint	= '',
			info	= '',
			warning	= '',
			error	= '',
		}
	},
	update_focused_file = {
		enable		= false,
		update_cwd	= false,
		ignore_list	= {}
	},
	system_open = {
		cmd  = 'open',
		args = {}
	},
	filters = {
		dotfiles = false,
		custom = {}
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {
				{ key = {'<CR>', 'l', '<2-LeftMouse>'},	cb = tree_cb('edit') },
				{ key = {'<2-RightMouse>', ']'},		cb = tree_cb('cd') },
				{ key = 'v',							cb = tree_cb('vsplit') },
				{ key = 's',							cb = tree_cb('split') },
				{ key = 't',							cb = tree_cb('tabnew') },
				{ key = 'h',							cb = tree_cb('parent_node') },
				{ key = 'K',							cb = tree_cb('first_sibling') },
				{ key = 'J',							cb = tree_cb('last_sibling') },
				{ key = 'I',							cb = tree_cb('toggle_ignored') },
				{ key = '.',							cb = tree_cb('toggle_dotfiles') },
				{ key = 'R',							cb = tree_cb('refresh') },
				{ key = 'a',							cb = tree_cb('create') },
				{ key = 'd',							cb = tree_cb('remove') },
				{ key = 'r',							cb = tree_cb('rename') },
				{ key = '<C-r>',						cb = tree_cb('full_rename') },
				{ key = 'x',							cb = tree_cb('cut') },
				{ key = 'c',							cb = tree_cb('copy') },
				{ key = 'p',							cb = tree_cb('paste') },
				{ key = 'y',							cb = tree_cb('copy_name') },
				{ key = 'Y',							cb = tree_cb('copy_path') },
				{ key = 'gy',							cb = tree_cb('copy_absolute_path') },
				{ key = 'g,',							cb = tree_cb('prev_git_item') },
				{ key = 'g;',							cb = tree_cb('next_git_item') },
				{ key = '-',							cb = tree_cb('dir_up') },
				{ key = 'o',							cb = tree_cb('system_open') },
				{ key = 'q',							cb = tree_cb('close') },
				{ key = 'g?',							cb = tree_cb('toggle_help') },
			}
		},
		number = false,
		relativenumber = false
	},
	trash = {
		cmd = 'trash',
		require_confirm = true
	}
}
