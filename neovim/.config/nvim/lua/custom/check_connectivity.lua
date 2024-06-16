local M = {}

M.check_connectivity = function()
  local ret = os.execute 'ping -c 3 8.8.8.8 > /dev/null 2>&1'
  return ret == 0
end

return M
