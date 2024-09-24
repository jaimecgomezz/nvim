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
		    { "<leader>bb", "<CMD> DBUIToggle <CR>", desc = "Toggle DB UI" },
        },
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast_temp.*" }
		end,
	},
}
