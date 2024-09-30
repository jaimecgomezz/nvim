return {
	{
		"jaimecgomezz/here.term",
		dependencies = {
			{ "mhinz/vim-startify" },
			{ "willothy/flatten.nvim", config = true, priority = 1001 },
		},
		opts = {
			startup_command = "Startify",
		},
		-- stylua: ignore
		keys = {
			{ "<C-;>", function() require("here-term").toggle_terminal() end, desc = "Toggle terminal", mode = { "n", "t" }, },
			{ "<C-S-;>", function() require("here-term").kill_terminal() end, desc = "Kill terminal", mode = { "n", "t" }, },
		},
	},
}
