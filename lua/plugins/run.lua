return {
	{
		"stevearc/overseer.nvim",
		cmd = {
			"OverseerOpen",
			"OverseerClose",
			"OverseerToggle",
			"OverseerSaveBundle",
			"OverseerLoadBundle",
			"OverseerDeleteBundle",
			"OverseerRunCmd",
			"OverseerRun",
			"OverseerInfo",
			"OverseerBuild",
			"OverseerQuickAction",
			"OverseerTaskAction",
			"OverseerClearCache",
		},
		opts = {
			form = { win_opts = { winblend = 0 } },
			confirm = { win_opts = { winblend = 0 } },
			task_win = { win_opts = { winblend = 0 } },
		},
		keys = {
			{ "<leader>ow", "<cmd>OverseerToggle<cr>", desc = "Task list" },
			{ "<leader>oo", "<cmd>OverseerRun<cr>", desc = "Run task" },
			{ "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
			{ "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
			{ "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
			{ "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
			{ "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
		},
	},
	{
		"pianocomposer321/officer.nvim",
		dependencies = "stevearc/overseer.nvim",
		opts = {},
	},
	{
		"Vigemus/iron.nvim",
		config = function()
			require("iron.core").setup({
				config = {
					repl_definition = {},
					repl_open_cmd = require("iron.view").split.vertical.botright(function()
						local min = 80
						local percentage = 0.5

						return math.max(math.floor(percentage * vim.o.columns), min)
					end),
				},
				keymaps = {
					send_line = "<leader>rs",
					visual_send = "<leader>rs",
					send_file = "<leader>rb",
					send_paragraph = "<leader>rp",
					send_until_cursor = "<leader>ru",
					send_mark = "<leader>rm",
					remove_mark = "<leader>rM",
					mark_motion = "<leader>rsm",
					mark_visual = "<leader>rsm",
					cr = "<leader>r<cr>",
					interrupt = "<leader>r<space>",
					exit = "<leader>rq",
					clear = "<leader>rl",
				},
			})
		end,
		-- stylua: ignore
		keys = { 
		    { "<leader>rr", function()
                if vim.o.buftype == "terminal" then
                    vim.cmd("close")
                else
                    vim.cmd("IronFocus")
                end
            end, desc = "Toggle REPL", },
		},
	},
}
