-- updates my nvim package managers
local function updatr()
	vim.api.nvim_eval("vsplit __Updatr__")
	vim.api.nvim_eval("normal! ggdG")
	vim.api.nvim_eval("setlocal filetype=updatr")
	vim.api.nvim_eval("setlocal buftype=nofile")
	-- vim.call('PaqSync')
	vim.fn['CocUpdateSync']()
	-- vim.call('CocUpdateSync')
end

return { updatr = updatr }
