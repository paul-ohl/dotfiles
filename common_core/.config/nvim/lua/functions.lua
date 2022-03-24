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

local function editSibling()
	local siblingFile
	local filename = vim.fn.expand('%:r')
	local extension = vim.fn.expand('%:e')
	local extTable = {
		['cpp'] = 'hpp',
		['hpp'] = 'cpp',
		['c'] = 'h',
		['h'] = 'c',
	}

	if string.find(filename, "srcs") ~= nil then
		siblingFile = string.gsub(filename, "srcs", "incs", 1) .. "." .. extTable[extension]
	elseif string.find(filename, "incs") ~= nil then
		siblingFile = string.gsub(filename, "incs", "srcs", 1) .. "." .. extTable[extension]
	else
		siblingFile = filename .. "." .. extTable[extension]
	end
	vim.api.nvim_command('edit ' .. siblingFile)
end

return { updatr = updatr, editSibling = editSibling }
