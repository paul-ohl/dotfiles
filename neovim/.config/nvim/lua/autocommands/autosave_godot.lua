vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand '~/Documents/godot' .. '/*',
  callback = function()
    vim.fn.jobstart('cargo build', {
      cwd = vim.fs.root(0, 'Cargo.toml') or vim.fn.getcwd(),
      on_exit = function(_, code)
        if code == 0 then
          vim.notify('cargo build succeeded ✓', vim.log.levels.INFO)
        else
          vim.notify('cargo build failed (exit code: ' .. code .. ')', vim.log.levels.ERROR)
        end
      end,
    })
  end,
})
