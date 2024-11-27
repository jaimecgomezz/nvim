return {
  {
    "jaimecgomezz/here.term",
    dependencies = { "mhinz/vim-startify" },
    opts = { startup_command = "Startify" },
  },
  {
    "willothy/flatten.nvim",
    priority = 1001,
    opts = function()
      local saved_terminal

      return {
        callbacks = {
          should_block = function(argv)
            return vim.tbl_contains(argv, "-b") or vim.tbl_contains(argv, "-d")
          end,
          pre_open = function()
            if vim.bo.buftype == "terminal" then
              saved_terminal = vim.api.nvim_get_current_buf()
            end
          end,
          post_open = function(bufnr, winnr, ft, is_blocking)
            if is_blocking and saved_terminal then
              saved_terminal:close()
            else
              vim.api.nvim_set_current_win(winnr)
            end
          end,
          block_end = function()
            vim.schedule(function()
              if saved_terminal then
                saved_terminal:open()
                saved_terminal = nil
              end
            end)
          end,
        },
      }
    end,
  },
}
