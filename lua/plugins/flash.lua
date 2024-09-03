local jump_to_line = function()
	require("flash").jump({
		search = { mode = "search", max_length = 0 },
		label = { after = { 0, 0 } },
		pattern = "^",
	})
end

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = true,
			},
			char = {
				jump_labels = true,
			},
		},
	},
	keys = {
		{
			"s",
			mode = { "n", "x" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{ "<C-j>", mode = { "n", "x", "o" }, jump_to_line, desc = "Jump to line" },
	},
}
