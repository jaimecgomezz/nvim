local config = function()
	vim.g.db_ui_use_nerd_fonts = 1
	vim.g.db_ui_show_database_icon = 1
	vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast_temp.*" }
	vim.g.db_ui_table_helpers = {
		["postgresql"] = {
			["Count"] = "SELECT COUNT(*) FROM {optional_schema}{table}",
			["Explain"] = "EXPLAIN ANALYZE {last_query}",
		},
	}

	vim.keymap.set("n", "<localleader>bt", "<CMD> tab DBUI <CR>", { desc = "DB UI" })
	vim.keymap.set("n", "<localleader>bb", "<CMD> DBUIToggle <CR>", { desc = "DB UI" })
	vim.keymap.set("n", "<localleader>bf", "<CMD> DBUIFindBuffer<CR>", { desc = "DB UI" })
end

return {
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-completion",
	{ "kristijanhusak/vim-dadbod-ui", config = config },
}
