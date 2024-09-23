return {
	{
		"andymass/vim-matchup",
	},
	{
		"wellle/targets.vim",
	},
	{
		"romainl/vim-cool",
	},
	{
		"tpope/vim-surround",
	},
	{
		"triglav/vim-visual-increment",
	},
	{
		"tpope/vim-repeat",
	},
	{
		"chrisgrieser/nvim-spider",
		opts = { consistentOperatorPending = true },
		-- stylua: ignore
		keys = {
			{ "e", function() require("spider").motion("e") end, mode = { "n", "o", "x" } },
			{ "w", function() require("spider").motion("w") end, mode = { "n", "o", "x" } },
			{ "b", function() require("spider").motion("b") end, mode = { "n", "o", "x" } },
            { "<C-f>", "<Esc>l<cmd>lua require('spider').motion('w')<CR>i", mode = "v" },
            { "<C-b>", "<Esc><cmd>lua require('spider').motion('b')<CR>i", mode = "v" },
		},
	},
	{
		"echasnovski/mini.move",
		version = "*",
		opts = {
			mappings = {
				left = "<C-S-h>",
				right = "<C-S-l>",
				down = "<C-S-j>",
				up = "<C-S-k>",

				line_left = "<C-S-h>",
				line_right = "<C-S-l>",
				line_down = "<C-S-j>",
				line_up = "<C-S-k>",
			},
		},
	},
}
