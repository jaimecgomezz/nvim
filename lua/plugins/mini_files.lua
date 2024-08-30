local config = function()
  require('mini.files').setup({
    options = { permanent_delete = false, },
    mappings = {
      reset = '',
      go_in = 'L',
      go_in_plus = 'l',
      go_out_plus = '',
    },
    windows = {
      max_number = 1,
      preview = true,
      width_focus = 50,
      width_nofocus = 15,
      width_preview = 120,
    },
  })


  -- Toggle dotfiles
  local show_dotfiles = true
  local filter_show = function(_) return true end
  local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, '.') end

  local toggle_dotfiles = function()
    show_dotfiles = not show_dotfiles
    local new_filter = show_dotfiles and filter_show or filter_hide
    MiniFiles.refresh({ content = { filter = new_filter } })
  end

  -- Set current working directory
  local files_set_cwd = function(_)
    -- Works only if cursor is on the valid file system entry
    local cur_entry_path = MiniFiles.get_fs_entry().path
    local cur_directory = vim.fs.dirname(cur_entry_path)
    vim.fn.chdir(cur_directory)
  end

  vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local buf_id = args.data.buf_id

      -- Set current working dir
      vim.keymap.set('n', 'H', files_set_cwd, { buffer = buf_id })

      -- Toggle dotfiles with common . keymap
      vim.keymap.set('n', '.', toggle_dotfiles, { buffer = buf_id })

      -- Traverse file tree with common Tab/Delete/Enter keymaps
      vim.keymap.set('n', '<Esc>', MiniFiles.close, { buffer = buf_id })
      vim.keymap.set('n', '<BS>', MiniFiles.go_out, { buffer = buf_id })
      vim.keymap.set('n', '<S-Tab>', MiniFiles.go_out, { buffer = buf_id })
      vim.keymap.set('n', '<CR>', function() MiniFiles.go_in({ close_on_file = true }) end, { buffer = buf_id })
      vim.keymap.set('n', '<Tab>', function() MiniFiles.go_in({ close_on_file = true }) end, { buffer = buf_id })
    end,
  })

  local toggle_filer = function(...)
    if not MiniFiles.close() then MiniFiles.open(...) end
  end

  vim.keymap.set('n', '<C-n>', toggle_filer, { desc = "Toggle filer" })
end

return({
  'echasnovski/mini.files',
  version = '*',
  config = config,
  dependencies = { 'echasnovski/mini.icons' },
})
