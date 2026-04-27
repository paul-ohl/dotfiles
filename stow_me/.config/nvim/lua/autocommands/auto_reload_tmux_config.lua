-- Define the autocommand group
local AUGroup = vim.api.nvim_create_augroup('TmuxConfig', { clear = true })

-- Create the autocommand
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = AUGroup,
  pattern = os.getenv 'HOME' .. '/.config/tmux/tmux.conf',
  callback = function()
    local command = 'tmux source-file ~/.config/tmux/tmux.conf'
    vim.fn.system(command) -- execute command without displaying output
  end,
})
