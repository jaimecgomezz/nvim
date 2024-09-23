return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			messages = { enabled = true },
			popupmenu = { enabled = false },
			notify = { enabled = true },
			lsp = {
				message = { enabled = true },
				progress = { enabled = false },
				hover = { enabled = false },
				signature = { enabled = false },
			},
			views = {
				confirm = {
					border = {
						style = "single",
					},
				},
				mini = {
					position = {
						row = 1,
					},
					border = {
						style = "single",
					},
					win_options = {
						winblend = 0,
					},
				},
			},
		},
	},
}
