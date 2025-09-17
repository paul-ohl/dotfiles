function GetStringUnderCursor()
  -- Save current register contents so we can restore later
  local old_reg = vim.fn.getreg '"'
  local old_type = vim.fn.getregtype '"'

  local function yank_motion(motion)
    vim.fn.setreg('"', '')
    vim.cmd('normal! ' .. motion)
    return vim.fn.getreg '"'
  end

  -- Try yanking from single and double quote
  vim.cmd "normal! m'" -- mark current position
  local single = yank_motion "yi'"
  vim.cmd "normal! `'" -- return to original position
  local double = yank_motion 'yi"'

  -- Decide which to use
  local function valid(s)
    return s and #s > 0
  end

  local result = nil
  if valid(single) and valid(double) then
    result = (#single <= #double) and single or double
  elseif valid(single) then
    result = single
  elseif valid(double) then
    result = double
  end

  -- Restore original register
  vim.fn.setreg('"', old_reg, old_type)

  return result
end

function OpenInBrowser(s)
  -- read the env var $BROWSER
  local browser = os.getenv 'BROWSER'

  if not browser then
    vim.notify('No $BROWSER environment variable set.', vim.log.levels.ERROR)
    return
  end

  vim.notify('Opening: ' .. s)
  vim.fn.system { browser, s }
end
