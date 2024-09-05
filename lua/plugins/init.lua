return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = { integrations = { overseer = true } },
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
	{
		"chrisbra/csv.vim",
		config = function()
			vim.cmd([[filetype plugin on]])
		end,
	},
	{
		"airblade/vim-rooter",
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
	{
		"echasnovski/mini.diff",
		version = "*",
		opts = { view = { style = "sign" } },
	},
	{
		"mistweaverco/kulala.nvim",
		ft = "http",
		keys = {
			{ "<leader>c", "", desc = "+Rest" },
			{ "<leader>cs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
			{ "<leader>ct", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
			{ "<leader>cp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
			{ "<leader>cn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
		},
		opts = {},
	},
	{
		"danymat/neogen",
		cmd = "Neogen",
		keys = {
			{ "<localleader>n", "<cmd>lua require('neogen').generate() ", desc = "Generate Annotations (Neogen)" },
		},
		opts = {
			snippet_engine = "luasnip",
			placeholders_text = {
				["description"] = "description",
				["tparam"] = "tparam",
				["parameter"] = "parameter",
				["return"] = "return",
				["class"] = "class",
				["throw"] = "throw",
				["varargs"] = "varargs",
				["type"] = "type",
				["attribute"] = "attribute",
				["args"] = "args",
				["kwargs"] = "kwargs",
			},
		},
	},
}
