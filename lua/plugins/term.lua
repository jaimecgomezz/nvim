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
	},
}
