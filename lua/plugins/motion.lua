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
		"chaoren/vim-wordmotion",
		init = function()
			vim.g.wordmotion_spaces = { "_", "-", ".", ":", "?" }
		end,
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
