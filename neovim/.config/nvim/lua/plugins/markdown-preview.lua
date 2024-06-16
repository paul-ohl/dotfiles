return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_auto_start = 0 -- Automatically open preview when opening a markdown file
    vim.g.mkdp_refresh_slow = 1 -- Refresh only when exiting insert mode and/or saving the file
    vim.g.mkdp_open_to_the_world = 1 -- Preview is open on 0.0.0.0 and available to other devices on the network
  end,
  ft = { 'markdown' },
}
