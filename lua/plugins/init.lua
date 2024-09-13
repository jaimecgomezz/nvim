return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					overseer = true,
					cmp = true,
					flash = true,
					grug_far = true,
					gitsigns = true,
					neogit = true,
					noice = false,
					dap = true,
					dap_ui = true,
					notify = true,
					nvim_surround = true,
					nvimtree = true,
					treesitter = true,
					ufo = true,
					indent_blankline = { enabled = true },
					telescope = { enabled = true },
					dadbod_ui = true,
					mason = true,
					markdown = true,
					render_markdown = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					neotest = true,
					harpoon = true,
				},
			})

			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({ options = { theme = "catppuccin" } })
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
			{ "<localleader>n", "<cmd>lua require('neogen').generate() <cr>", desc = "Generate Annotations (Neogen)" },
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
	{
		{
			"chrishrb/gx.nvim",
			keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
			cmd = { "Browse" },
			init = function()
				vim.g.netrw_nogx = 1
			end,
			dependencies = { "nvim-lua/plenary.nvim" },
			config = true,
			submodules = false,
		},
	},
	{
		"lambdalisue/vim-suda",
		config = function()
			vim.g.suda_smart_edit = 1
		end,
	},
	{
		"rhysd/reply.vim",
		cmd = { "Repl", "ReplAuto" },
		keys = {
			{ "<leader>ra", "<CMD> ReplAuto <CR>", desc = "Open RPL", mode = { "n" } },
			{ "<leader>rr", "<CMD> Repl <CR>", desc = "Open RPL", mode = { "n" } },
			{ "<leader>rr", "<CMD>'<,'> Repl <CR>", desc = "Open RPL", mode = { "v" } },
			{ "<leader>rs", "<CMD> ReplSend <CR>", desc = "Open RPL", mode = { "n" } },
			{ "<leader>rs", "<CMD>'<,'> ReplSend <CR>", desc = "Open RPL", mode = { "v" } },
			{ "<leader>rl", "<CMD> ReplList <CR>", desc = "List RPLs", mode = { "n" } },
			{ "<leader>rk", "<CMD> ReplStop <CR>", desc = "Stop RPL", mode = { "n" } },
		},
	},
	{
		"anuvyklack/hydra.nvim",
	},
	{
		"xiyaowong/transparent.nvim",
	},
}
