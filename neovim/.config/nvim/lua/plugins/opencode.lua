return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  event = 'VeryLazy',
  config = function()
    vim.g.opencode_opts = {
      -- Default configuration is usually fine
    }

    vim.o.autoread = true -- Required for opts.events.reload

    -- Opencode keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = 'Opencode: [A]sk' })

    vim.keymap.set({ 'n', 'x' }, '<leader>ox', function()
      require('opencode').select()
    end, { desc = 'Opencode: [X]ecute Action' })

    vim.keymap.set({ 'n', 't' }, '<leader>ot', function()
      require('opencode').toggle()
    end, { desc = 'Opencode: [T]oggle' })

    -- Movement/Navigation within Opencode session
    vim.keymap.set('n', '<leader>ou', function()
      require('opencode').command('session.half.page.up')
    end, { desc = 'Opencode: Scroll [U]p' })

    vim.keymap.set('n', '<leader>od', function()
      require('opencode').command('session.half.page.down')
    end, { desc = 'Opencode: Scroll [D]own' })

    -- Operator for range selection
    vim.keymap.set({ 'n', 'x' }, 'go', function()
      return require('opencode').operator('@this ')
    end, { desc = 'Opencode: Add range', expr = true })

    vim.keymap.set('n', 'goo', function()
      return require('opencode').operator('@this ') .. '_'
    end, { desc = 'Opencode: Add line', expr = true })
  end,
}
