--
--     ::::::::   ::::::  :::   ::: :::
--    :+:   :+: :+:  :+: :+:   :+: :+:  Paul OHL
--   +#++++#+  +#+  +:+ +#++:+#++ +#+
--  #+#       #+#  #+# #+#   #+# #+#
-- ###        ######  ###   ### #######
--
-- Created: 2022/03/17 16:35:28

-- Paq bootstrap
local function bootstrap_paq()
	-- Load Paq
	vim.cmd('packadd paq-nvim')

	-- Exit nvim after installing plugins
	vim.cmd('autocmd User PaqDoneInstall quit')

	-- Read and install packages
	require('packages')
	require('paq').install()
end

return { bootstrap_paq = bootstrap_paq }

-- Auto install required apps
-- local apps = {
	-- 	{'rg', 'ripgrep'},
	-- 	{'node', ''},
	-- 	{'python', ''},
	-- 	{'bear', ''},
	-- }
