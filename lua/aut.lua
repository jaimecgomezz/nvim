-- Always open help pages in a left vertical split.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd.wincmd("L")
  end,
})

-- Close certain files with `q`
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help" },
  callback = function()
    vim.keymap.set("n", "q", vim.cmd.bd, { desc = "Close", buffer = vim.api.nvim_get_current_buf() })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf", "fugitive", "git", "neotest-summary" },
  callback = function()
    vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close", buffer = vim.api.nvim_get_current_buf() })
  end,
})

-- Close terminals with `q`
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close", buffer = vim.api.nvim_get_current_buf() })
    vim.cmd.startinsert()
  end,
})

-- Change to insert mode when entered to terminal buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd.startinsert()
    end
  end,
})

-- Dynamicalle create missing dirs on write
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    local dirname = vim.fs.dirname(event.match)
    vim.fn.mkdir(dirname, "p", tonumber("0755", 8))
  end,
})

-- Hide quickfix and loclist buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  callback = function()
    vim.bo.buflisted = false
  end,
})
