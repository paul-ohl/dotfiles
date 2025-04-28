Auto update files when they change:
```lua
vim.opt.autoread = true

-- Fonction pour vérifier les changements
local function auto_checktime()
  vim.cmd('checktime')
end

-- Lance un timer qui check toutes les 2 secondes
local timer = vim.loop.new_timer()
timer:start(0, 500, vim.schedule_wrap(auto_checktime))
```


## Autocommand to autosave:

```
:autocmd TextChanged,TextChangedI <buffer> silent write
```

Remove the format on save, and only format when the cursor is idle for too long
