local function config_splits()
	require("smart-splits").setup({
		default_amount = 5,
		at_edge = "stop",
		resize_mode = {
			quit_key = "<ESC>",
			silent = true,
		},
	})

	-- moving between splits
	vim.keymap.set("n", "<A-h>", require("smart-splits").move_cursor_left)
	vim.keymap.set("n", "<A-j>", require("smart-splits").move_cursor_down)
	vim.keymap.set("n", "<A-k>", require("smart-splits").move_cursor_up)
	vim.keymap.set("n", "<A-l>", require("smart-splits").move_cursor_right)

	-- Resize windows
	vim.keymap.set("n", "<C-A-h>", require("smart-splits").resize_left)
	vim.keymap.set("n", "<C-A-j>", require("smart-splits").resize_down)
	vim.keymap.set("n", "<C-A-k>", require("smart-splits").resize_up)
	vim.keymap.set("n", "<C-A-l>", require("smart-splits").resize_right)
	vim.keymap.set("n", "<leader>br", require("smart-splits").start_resize_mode)
end

local function config_shift()
	require("winshift").setup({
		keymaps = {
			disable_defaults = true, -- Disable the default keymaps
			win_move_mode = {
				["h"] = "left",
				["j"] = "down",
				["k"] = "up",
				["l"] = "right",
				["H"] = "far_left",
				["J"] = "far_down",
				["K"] = "far_up",
				["L"] = "far_right",
			},
		},
	})

	vim.keymap.set("n", "<leader>bs", "<Cmd>WinShift<CR>", { desc = "Shift window" })
end

return {
	{
		"mrjones2014/smart-splits.nvim",
		config = config_splits,
	},
	{
		"sindrets/winshift.nvim",
		config = config_shift,
	},
}
