return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			char = {
				jump_labels = true,
			},
		},
	},
	-- stylua: ignore
	keys = {
		{ "s", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x" } },
		{ "r", function() require("flash").remote() end, desc = "Remote Flash", mode = "o" },
	},
}
