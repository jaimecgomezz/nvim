local config = function()
	require("nvim-tree").setup({
		auto_reload_on_write = true,
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		git = { enable = false },
		filesystem_watchers = { enable = true },
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = true,
			},
		},
		view = {
			adaptive_size = false,
			side = "left",
			preserve_window_proportions = true,
			width = {
				min = 40,
			},
		},
		renderer = {
			root_folder_label = false,
			highlight_git = false,
			highlight_opened_files = "none",
			indent_markers = { enable = true },
		},
	})

	vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle filer" })
end
return {
	{
		"nvim-tree/nvim-web-devicons",
		config = function(_, opts)
			require("nvim-web-devicons").setup(opts)
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		config = config,
	},
}
