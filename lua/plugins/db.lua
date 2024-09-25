return {
	{
		"tpope/vim-dadbod",
	},
	{
		"kristijanhusak/vim-dadbod-completion",
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		-- stylua: ignore
		keys = {
		    { "<localleader>dd", "<CMD> DBUIToggle <CR>", desc = "Toggle DB UI" },
		    { "<localleader>df", "<CMD> DBUIFindBuffer <CR>", desc = "Find query in drawer" },
		    { "<localleader>dl", "<CMD> DBUILastQueryInfo <CR>", desc = "Find query in drawer" },
        },
		-- stylua: ignore
		init = function ()
			vim.g.db_ui_use_nvim_notify = 1
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_execute_on_save = 0
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = 1
            vim.g.db_ui_tmp_query_location = "~/tmp/dbui"
			vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast_temp.*" }
		end
,
	},
}
