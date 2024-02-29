-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
  backup = false, -- creates a backup file
  errorbells = false, -- no error bells
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  undofile = true, -- enable persistent undo
  undodir = vim.fn.stdpath("data") .. "/undodir", -- save undos in ~/.local/share/nvim/undodir/
  writebackup = false, -- if a file is being edited by another program, it is not allowed to be edited
  wrap = true, -- break lines
  linebreak = true, -- break lines without cutting words
  scrolloff = 4, -- scroll automatically when you reach the bottom of the buffer
}

local function set_vim_option(key, value)
  vim.opt[key] = value
end

local failed_options = {}
for k, v in pairs(options) do
  if not pcall(set_vim_option, k, v) then
    table.insert(failed_options, k)
  end
end
if #failed_options == 1 then
  print("option " .. failed_options[1] .. " failed to be set.")
elseif #failed_options > 1 then
  local output = "options failed: "
  for _, option_name in pairs(failed_options) do
    output = output .. option_name .. ", "
  end
  print(output)
end

-- This part of the file is for abbreviations
local function abbrev(input, output)
  if type(input) == "table" then
    for _, v in ipairs(input) do
      abbrev(v, output)
    end
    return
  end
  vim.cmd("iabbrev " .. input .. " " .. output)
end

abbrev("whiel", "while")
abbrev({ "retrun", "reutnr", "reutrn", "reutn" }, "return")
abbrev({ "slef", "sefl", "sfel", "sfle" }, "self")
