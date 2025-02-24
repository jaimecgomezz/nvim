local db_filetypes = { "sql", "redis" }

return {
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-completion",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    keys = {
      { "<leader>qq", "<CMD> DBUIToggle <CR>", desc = "Toggle DB UI" },
      { "<leader>qf", "<CMD> DBUIFindBuffer <CR>", desc = "Find query in drawer" },
      { "<leader>ql", "<CMD> DBUILastQueryInfo <CR>", desc = "Find query in drawer" },
      { "<leader>sw", "<Plug>(DBUI_SaveQuery)", desc = "Save query", ft = "sql", ft = db_filetypes },
      { "<leader>se", "<Plug>(DBUI_EditBindParameters)", desc = "Edit query bind params", ft = db_filetypes },
      { "<leader>ss", "<Plug>(DBUI_ExecuteQuery)", desc = "Send query", mode = { "n", "v" }, ft = db_filetypes },
    },
    init = function()
      vim.g.db_ui_disable_mappings_sql = 1
      vim.g.db_ui_disable_mappings_redis = 1
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_execute_on_save = 0
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast_temp.*" }
    end,
  },
}
