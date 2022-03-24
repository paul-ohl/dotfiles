--
--     ::::::::   ::::::  :::   ::: :::
--    :+:   :+: :+:  :+: :+:   :+: :+:  Paul OHL
--   +#++++#+  +#+  +:+ +#++:+#++ +#+
--  #+#       #+#  #+# #+#   #+# #+#
-- ###        ######  ###   ### #######
--
-- Created: 2022/03/17 16:35:28

-- Paq bootstrap
local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(path)) > 0 then
	-- clone paq
	PaqBootstrap = vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', path }
	-- Load Paq
	vim.cmd('packadd paq-nvim')
	local paq = require('paq')
	require('plugins')
end

-- Auto install required apps
-- local apps = {
-- 	{'rg', 'ripgrep'},
-- 	{'node', ''},
-- 	{'python', ''},
-- 	{'bear', ''},
-- }
