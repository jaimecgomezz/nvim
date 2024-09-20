return {
	{
		"ludovicchabant/vim-gutentags",
	},
	{
		"preservim/tagbar",
		init = function()
			vim.g.gutentags_ctags_executable_ruby = "ripper-tags"

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
		end,
		keys = {
			{ "<localleader>t", "<cmd>TagbarToggle<cr>", desc = "Open tagbar" },
		},
	},
}
