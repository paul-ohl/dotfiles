P = function(v)
	print(vim.inspect(v))
	return v
end

R = function(plugin_name)
	return require("plenary.reload").reload_module(plugin_name, true)
end
