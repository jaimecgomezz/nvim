return {
	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 60,
			render = "compact",
			stages = "fade",
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		version = "4.4.7",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			messages = { enabled = false },
			popupmenu = { enabled = false },
			notify = { enabled = true },
			lsp = {
				message = {
					enabled = true,
					view = "notify",
				},
				progress = { enabled = false },
				hover = { enabled = false },
				signature = { enabled = false },
			},
			views = {
				confirm = { border = { style = "single" } },
			},
		},
	},
}
