return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{
		"romainl/vim-cool",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"andymass/vim-matchup",
	},
	{
		"chaoren/vim-wordmotion",
	},
	{
		"tpope/vim-surround",
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ user_default_options = { mode = "virtualtext" } })
		end,
	},
}
