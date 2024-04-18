local M = {}

local function pos_equal(p1, p2)
  local r1, c1 = unpack(p1)
  local r2, c2 = unpack(p2)
  return r1 == r2 and c1 == c2
end

M.goto_error_then_hint = function(go_backwards)
  local is_back = go_backwards or false

  local init_pos = vim.api.nvim_win_get_cursor(0)
  local err_diag_options = { severity = vim.diagnostic.severity.ERROR, float = true, wrap = true }

  if is_back then
    vim.diagnostic.goto_prev(err_diag_options)
  else
    vim.diagnostic.goto_next(err_diag_options)
  end

  local new_pos = vim.api.nvim_win_get_cursor(0)
  if pos_equal(init_pos, new_pos) then
    if is_back then
      vim.diagnostic.goto_prev()
    else
      vim.diagnostic.goto_next()
    end
  end
end

return M
