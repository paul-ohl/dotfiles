-- Org variables
OrgFolder = vim.fn.expand '~' .. '/Documents/org/'
local org_index = OrgFolder .. 'index.org'

function OpenOrgIndexInNewTab()
  if vim.fn.filereadable(org_index) ~= 1 then
    print('Org index file does not exist: ' .. org_index)
    return
  end

  vim.cmd('tabnew ' .. org_index)
  vim.cmd('lcd ' .. OrgFolder)
  vim.cmd 'setlocal filetype=org'
end

function OpenOrgIndexInSplit()
  if vim.fn.filereadable(org_index) ~= 1 then
    print('Org index file does not exist: ' .. org_index)
    return
  end

  vim.cmd('vsplit ' .. org_index)
  vim.cmd('lcd ' .. OrgFolder)
  vim.cmd 'setlocal filetype=org'
end

function OpenOrgIndex()
  if vim.fn.filereadable(org_index) ~= 1 then
    print('Org index file does not exist: ' .. org_index)
    return
  end

  vim.cmd('edit ' .. org_index)
  vim.cmd 'setlocal filetype=org'
end

-- Create commands
vim.api.nvim_create_user_command('OrgIndex', OpenOrgIndex, {})
vim.api.nvim_create_user_command('OrgIndexTab', OpenOrgIndexInNewTab, {})
vim.api.nvim_create_user_command('OrgIndexSplit', OpenOrgIndexInSplit, {})
