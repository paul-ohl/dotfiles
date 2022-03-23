local fn = vim.fn

-- auto install paq, my package manager
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

-- Auto install required apps
local apps = {
	{'rg', 'ripgrep'},
	{'node', ''},
	{'python', ''},
	{'bear', ''},
}
