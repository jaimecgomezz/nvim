return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			extensions = {
				"quickfix",
				"fugitive",
				"man",
				"nvim-tree",
				"oil",
				"overseer",
				"toggleterm",
			},
			options = {
				ignore_focus = {
					"dapui_watches",
					"dapui_breakpoints",
					"dapui_scopes",
					"dapui_console",
					"dapui_stacks",
					"dap-repl",
				},
			},
		},
	},
	{
		"romainl/vim-cool",
	},
	{
		"jiangmiao/auto-pairs",
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
		"NvChad/nvim-colorizer.lua",
		opts = { user_default_options = { mode = "virtualtext" } },
	},
	{
		"chrisbra/csv.vim",
		config = function()
			vim.cmd([[filetype plugin on]])
		end,
	},
	{
		"airblade/vim-rooter",
		init = function()
			vim.g.rooter_patterns = { ".git", "Makefile" }
			vim.g.rooter_change_directory_for_non_project_files = "current"
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
	{
		"chrishrb/gx.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1
		end,
		config = true,
		submodules = false,
		keys = {
			{ "gx", "<cmd>Browse<cr>", mode = { "n", "x" } },
		},
	},
	{
		"lambdalisue/vim-suda",
		init = function()
			vim.g.suda_smart_edit = 1
		end,
	},
	{
		"anuvyklack/hydra.nvim",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = { { "Bilal2453/luvit-meta", lazy = true } },
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"andrewferrier/debugprint.nvim",
		opts = {
			keymaps = {
				normal = {
					plain_below = "<leader>dp",
					plain_above = "<leader>dP",
					variable_below = "<leader>dv",
					variable_above = "<leader>dV",
					toggle_comment_debug_prints = "<leader>dt",
					delete_debug_prints = "<leader>dD",
				},
				visual = {
					variable_below = "<leader>dv",
					variable_above = "<leader>dV",
				},
			},
		},
	},
}
