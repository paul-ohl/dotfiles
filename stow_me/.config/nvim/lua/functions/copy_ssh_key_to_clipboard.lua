function CopyAnySSHPubKey()
  local ssh_dir = vim.fn.expand '~/.ssh'
  local files = vim.fn.globpath(ssh_dir, '*.pub', false, true)

  if vim.tbl_isempty(files) then
    vim.notify('No SSH public keys found in ~/.ssh', vim.log.levels.WARN)
    return
  end

  local function copy_file(filepath)
    local lines = vim.fn.readfile(filepath)
    if not lines or #lines == 0 then
      vim.notify('Selected key file is empty: ' .. filepath, vim.log.levels.WARN)
      return
    end
    local key = table.concat(lines, '\n')
    vim.fn.setreg('+', key)
    vim.notify('Copied ' .. vim.fn.fnamemodify(filepath, ':t') .. ' to clipboard.')
  end

  if #files == 1 then
    copy_file(files[1])
  else
    -- Create display names (filenames only)
    local choices = vim.tbl_map(function(fullpath)
      return vim.fn.fnamemodify(fullpath, ':t')
    end, files)

    vim.ui.select(choices, { prompt = 'Select SSH public key to copy:' }, function(choice)
      if not choice then
        vim.notify('No key selected.', vim.log.levels.INFO)
        return
      end
      local selected_path = ssh_dir .. '/' .. choice
      copy_file(selected_path)
    end)
  end
end
