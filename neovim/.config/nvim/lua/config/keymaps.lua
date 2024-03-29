-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")

-- Remove keymaps I don't want to use
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`") -- I may not want to delete that one
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- Set custom keymaps
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", opts)
vim.keymap.set("v", "K", ":m '>-2<cr>gv=gv", opts)
vim.keymap.set("n", "<leader>ul", function()
  Util.toggle("relativenumber")
end, opts)
vim.keymap.set("n", "<leader>uL", function()
  Util.toggle.number()
end, opts)
vim.keymap.set("n", "<cr>", "j^zz", opts)
vim.keymap.set("n", "-", "k^zz", opts)
vim.keymap.set("n", "[[", "<c-t>", opts)

-- Plugin keymaps
vim.keymap.set("n", "<C-n>", function()
  require("notify").dismiss({ pending = false, silent = true })
end, opts)

-- Window management
vim.keymap.set("n", "<leader><tab>", "<c-^>", opts)
vim.keymap.set("n", "<leader>ws", "<c-w>s", opts)
vim.keymap.set("n", "<leader>wv", "<c-w>v", opts)
vim.keymap.set("n", "<c-s-h>", "<c-w>H", opts)
vim.keymap.set("n", "<c-s-j>", "<c-w>J", opts)
vim.keymap.set("n", "<c-s-k>", "<c-w>K", opts)
vim.keymap.set("n", "<c-s-l>", "<c-w>L", opts)

-- Tab management
vim.keymap.set("n", "<tab>", "gt", opts)
vim.keymap.set("n", "<S-tab>", "gT", opts)
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>")
vim.keymap.set("n", "<leader>te", "<C-w>T")
vim.keymap.set("n", "<leader>t<", ":tabmove -<CR>")
vim.keymap.set("n", "<leader>t>", ":tabmove +<CR>")
vim.keymap.set("n", "<leader>t0", ":tabmove 0<CR>")
