require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },

	automatic_installation = true
})

-- local dap = require('dap')
-- dap.configurations.cpp = {
-- 	{
-- 		name = "Launch file",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- 		end,
-- 		cwd = '${workspaceFolder}',
-- 		stopOnEntry = false,
-- 	},
-- }
-- dap.configurations.rust = dap.configurations.cpp
-- dap.configurations.c = dap.configurations.cpp
--
-- dap.adapters.codelldb = {
-- 	type = 'server',
-- 	port = "${port}",
-- 	executable = {
-- 		-- CHANGE THIS to your path!
-- 		command = '/Users/pohl/.local/share/nvim/mason/bin/codelldb',
-- 		args = {"--port", "${port}"},
--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   }
-- }
--
-- vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').step_over() end)
-- vim.keymap.set('n', '<Leader>dj', function() require('dap').step_into() end)
-- vim.keymap.set('n', '<Leader>dk', function() require('dap').step_out() end)
-- vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
-- -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
-- -- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
-- vim.keymap.set({'n', 'v'}, '<Leader>K', function()
-- 	require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
-- 	require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
-- 	local widgets = require('dap.ui.widgets')
-- 	widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
-- 	local widgets = require('dap.ui.widgets')
-- 	widgets.centered_float(widgets.scopes)
-- end)
