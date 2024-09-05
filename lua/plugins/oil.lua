local config = function()
	require("oil").setup({
		default_file_explorer = false,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_split",
			["<C-v>"] = "actions.select_vsplit",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["q"] = "actions.close",
			["<C-c>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["."] = "actions.toggle_hidden",
			["gt"] = "actions.toggle_trash",
		},
		win_options = { cursorline = true },
		use_default_keymaps = false,
		view_options = { show_hidden = false },
	})

	vim.keymap.set("n", "<localleader>o", "<CMD> Oil <CR>", { desc = "Open oil" })
end

return {
	"stevearc/oil.nvim",
	config = config,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
