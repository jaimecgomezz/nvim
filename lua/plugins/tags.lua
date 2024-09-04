local config = function()
	vim.g.tagbar_autoclose = 1
	vim.g.tagbar_width = 80
	vim.g.tagbar_autofocus = 1
	vim.g.tagbar_compact = 2
	vim.g.tagbar_show_data_type = 1
	vim.g.tagbar_autoshowtag = 1
	vim.g.tagbar_ignore_anonymous = 1
	vim.g.tagbar_show_visibility = 1
	vim.g.tagbar_previewwin_pos = ""
	vim.g.tagbar_autopreview = 0
	vim.g.tagbar_sort = 0

	vim.keymap.set("n", "<localleader>t", "<cmd>TagbarToggle<cr>", { desc = "Open tagbar" })
end

return {
	"ludovicchabant/vim-gutentags",
	{
		"preservim/tagbar",
		config = config,
	},
}
