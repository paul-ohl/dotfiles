local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("Could not load nvim_tree plugin")
	return
end

local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

local function nvim_tree_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', ']', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', 'h', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'g,', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', 'g;', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '[', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'o', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))

end

nvim_tree.setup {
	hijack_cursor       = true,
	update_cwd          = false,
	on_attach 			= nvim_tree_on_attach,
	diagnostics         = {
		enable = true,
		icons = {
			hint = '',
			info = '',
			warning = '',
			error = '',
		}
	},
	update_focused_file = {
		enable      = true,
		update_cwd  = false,
		ignore_list = {}
	},
	system_open         = {
		cmd  = 'open',
		args = {}
	},
	filters             = {
		dotfiles = false,
		custom = {}
	},
	git                 = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view                = {
		width = 30,
		hide_root_folder = false,
		side = 'left',
		mappings = {
			custom_only = true,
			list = {
				{ key = { '<CR>', 'l', '<2-LeftMouse>' }, cb = tree_cb('edit') },
				{ key = { '<2-RightMouse>', ']' }, cb = tree_cb('cd') },
				{ key = 'v', cb = tree_cb('vsplit') },
				{ key = 's', cb = tree_cb('split') },
				{ key = 't', cb = tree_cb('tabnew') },
				{ key = 'h', cb = tree_cb('parent_node') },
				{ key = 'K', cb = tree_cb('first_sibling') },
				{ key = 'J', cb = tree_cb('last_sibling') },
				{ key = 'I', cb = tree_cb('toggle_ignored') },
				{ key = '.', cb = tree_cb('toggle_dotfiles') },
				{ key = 'R', cb = tree_cb('refresh') },
				{ key = 'a', cb = tree_cb('create') },
				{ key = 'd', cb = tree_cb('remove') },
				{ key = 'r', cb = tree_cb('rename') },
				{ key = '<C-r>', cb = tree_cb('full_rename') },
				{ key = 'x', cb = tree_cb('cut') },
				{ key = 'c', cb = tree_cb('copy') },
				{ key = 'p', cb = tree_cb('paste') },
				{ key = 'y', cb = tree_cb('copy_name') },
				{ key = 'Y', cb = tree_cb('copy_path') },
				{ key = 'gy', cb = tree_cb('copy_absolute_path') },
				{ key = 'g,', cb = tree_cb('prev_git_item') },
				{ key = 'g;', cb = tree_cb('next_git_item') },
				{ key = { '-', '[' }, cb = tree_cb('dir_up') },
				{ key = 'o', cb = tree_cb('system_open') },
				{ key = 'q', cb = tree_cb('close') },
				{ key = 'g?', cb = tree_cb('toggle_help') },
				{ key = '<Tab>', action = '' },
			}
		},
		number = false,
		relativenumber = false
	},
	trash               = {
		cmd = 'trash',
		require_confirm = true
	}
}
