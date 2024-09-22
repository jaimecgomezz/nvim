return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = { automatic_installation = true, handlers = {} },
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"jaimecgomezz/nvim-dap-ruby-rdbg",
				opts = { nonstop = false },
			},
			{
				"Weissle/persistent-breakpoints.nvim",
				opts = {
					load_breakpoints_event = { "BufReadPost" },
				},
			},
		},
		  -- stylua: ignore
        keys = {
            { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
            { "<leader>dB", function() require('persistent-breakpoints.api').set_conditional_breakpoint() end, desc = "Breakpoint Condition" },
            { "<leader>db", function() require('persistent-breakpoints.api').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
            { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
            { "<leader>dg", function() require("dap").run_to_cursor() end, desc = "Go to Line (No Execute)" },
            { "<leader>dl", function() require("dap").step_into() end, desc = "Step Into" },
            { "<leader>dL", function() require("dap").step_over() end, desc = "Step Over" },
            { "<leader>dh", function() require("dap").step_back() end, desc = "Step back" },
            { "<leader>dH", function() require("dap").step_out() end, desc = "Step Out" },
            { "<leader>dj", function() require("dap").down() end, desc = "Down" },
            { "<leader>dk", function() require("dap").up() end, desc = "Up" },
            { "<leader>dR", function() require("dap").restart() end, desc = "Restart session" },
            { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate session" },
            { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
            { "<leader>du", function() require("dap").reverse_continue() end, desc = "Reverse continue" },
            { "<leader>ds", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dw", function () require('persistent-breakpoints.api').set_log_point() end, desc = "Set log point" },
            { "<leader>dx", function() require('persistent-breakpoints.api').clear_all_breakpoints() end, desc = "Clear breakpoints" },
        },
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		init = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = dapui.open
			dap.listeners.before.launch.dapui_config = dapui.open
			dap.listeners.before.event_terminated.dapui_config = dapui.close
			dap.listeners.before.event_exited.dapui_config = dapui.close

			vim.fn.sign_define("DapBreakpointRejected", { linehl = "", text = "", texthl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" })
			vim.fn.sign_define("DapBreakpoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ linehl = "", text = "", texthl = "diffRemoved", numhl = "" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ linehl = "GitSignsChangeVirtLn", text = "", texthl = "diffChanged", numhl = "" }
			)
		end,
		opts = {
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = { "scopes", "stacks", "breakpoints" },
					size = 60,
					position = "left",
				},
			},
		},
        -- stylua: ignore
        keys = {
            { "<leader>dd", function() require("dapui").toggle() end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval(vim.fn.getline("."), { context = "repl" }) end, desc = "Eval", mode = {"n", "v"} },
        },
	},
}
