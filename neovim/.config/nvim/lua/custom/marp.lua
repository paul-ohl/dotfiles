local job_id = 0

StartMarp = function()
  local parent_folder_path = vim.fn.expand '%:h'
  local file_name = vim.fn.expand '%:t'

  local server_cmd = string.format('PORT=5000 marp --server %s', parent_folder_path)
  local open_cmd = string.format('firefox --new-window "localhost:5000/%s"', file_name)

  job_id = vim.fn.jobstart(server_cmd, { detach = true, silent = true })
  vim.fn.jobstart(open_cmd, { detach = true })
end

StopMarp = function()
  if job_id == 0 then
    return
  end
  vim.fn.jobstop(job_id)
end
