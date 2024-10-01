return {
	{
		"otavioschwanck/arrow.nvim",
		lazy = false,
		opts = {
			hide_handbook = true,
			mappings = {
				edit = "e",
				delete_mode = "d",
				clear_all_items = "X",
				toggle = "a",
				open_vertical = "v",
				open_horizontal = "s",
				quit = "q",
				remove = "x",
				next_item = "]",
				prev_item = "[",
			},
			window = {
				border = "single",
			},
			per_buffer_config = {
				lines = 5,
			},
			leader_key = "'",
		},
	-- stylua: ignore
        keys = {
            { "H", function() require("arrow.persist").previous() end, desc = "Previous arrowed file" },
            { "L", function() require("arrow.persist").next() end, desc = "Next arrowed file" },
            { "<C-h>", function() require("arrow.persist").toggle() end, desc = "Arrow file" },
        },
	},
	{
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
	},
	{
		"MattesGroeger/vim-bookmarks",
		init = function()
			vim.g.bookmark_no_default_key_mappings = 1
			vim.g.bookmark_save_per_working_dir = 1
			vim.g.bookmark_auto_save = 1
		end,
		keys = {
			{ "mm", "<CMD> BookmarkToggle <CR>", desc = "Toggle bookmark" },
			{
				"mM",
				function()
					vim.ui.input({ prompt = "Comment: " }, function(comment)
						if comment ~= nil and comment ~= "" then
							cmd = "BookmarkAnnotate " .. comment
							vim.cmd(cmd)
						end
					end)
				end,
				desc = "Toggle commentary bookmark",
			},
			{ "mn", "<CMD> BookmarkNext <CR>", desc = "Next bookmark" },
			{ "mp", "<CMD> BookmarkPrev <CR>", desc = "Previous bookmark" },
			{ "ml", "<CMD> BookmarkShowAll <CR>", desc = "Show all bookmark" },
			{ "mx", "<CMD> BookmarkClearAll <CR>", desc = "Clear all bookmark" },
		},
	},
}
