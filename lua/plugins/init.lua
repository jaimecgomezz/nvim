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
		"wellle/targets.vim",
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
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ user_default_options = { mode = "virtualtext" } })
		end,
	},
}
