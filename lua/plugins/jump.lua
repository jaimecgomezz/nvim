return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {
			autojump = true,
		},
		label = {
			after = false,
			before = true,
		},
		modes = {
			char = {
				autohide = true,
				jump_labels = true,
			},
			treesitter_search = {
				search = { incremental = true },
				label = {
					before = true,
					after = false,
					style = "overlay",
				},
			},
		},
		prompt = { enabled = false },
	},
	-- stylua: ignore
	keys = {
		{ "s", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x" } },
		{ "r", function() require("flash").remote() end, desc = "Remote Flash", mode = "o" },
        { "?", function() require("flash").treesitter_search() end, desc = "Treesitter Search", mode = { "n", "o", "x" } },
        { "<C-s>", function() require("flash").toggle() end, desc = "Toggle Flash Search", mode = { "c" } },
	},
}
