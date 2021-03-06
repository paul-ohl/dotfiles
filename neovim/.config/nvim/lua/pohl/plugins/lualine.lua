local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("Cannot load lualine module")
	return
end

-- Mappings!
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", '<Leader>tr', "<Cmd>LualineRenameTab<CR>", opts)

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
	lualine_c = {
		{
			'filename',
			path = 1,
			file_status = true,
			symbols = {
				modified = ' ',
				readonly = ' ',
				unnamed = '[No Name]',
			}
		}
	},
    lualine_x = {{'filetype', colored = true, icon_only = false}},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
	  lualine_a = {{'tabs', mode=2}},
	  lualine_b = {},
	  lualine_c = {},
	  lualine_x = {'filename'},
	  lualine_y = {'branch'},
	  lualine_z = {'os.date("%R | %a %d %b")'},
  },
  extensions = {}
}
