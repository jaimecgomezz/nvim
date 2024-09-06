local config = function()
	vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

	vim.api.nvim_call_function(
		"sign_define",
		{ "DapBreakpoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
	)

	vim.api.nvim_call_function(
		"sign_define",
		{ "DapBreakpointCondition", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
	)

	vim.api.nvim_call_function(
		"sign_define",
		{ "DapLogPoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
	)

	vim.api.nvim_call_function(
		"sign_define",
		{ "DapStopped", { linehl = "GitSignsChangeVirtLn", text = "", texthl = "diffChanged", numhl = "" } }
	)

	vim.api.nvim_call_function(
		"sign_define",
		{ "DapBreakpointRejected", { linehl = "", text = "", texthl = "", numhl = "" } }
	)
end

local config_dapui = function()
	local dap = require("dap")
	local dapui = require("dapui")

	dapui.setup({
		icons = { collapsed = "", current_frame = "", expanded = "" },
		layouts = {
			{
				elements = { "scopes", "watches", "stacks", "breakpoints" },
				size = 80,
				position = "left",
			},
			{ elements = { "console", "repl" }, size = 0.25, position = "bottom" },
		},
		render = { indent = 2 },
	})

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close({})
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close({})
	end
end

return {
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = config_dapui,
        -- stylua: ignore
        keys = {
            { "<leader>dd", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval(vim.fn.getline("."), { context = "repl" }) end, desc = "Eval", mode = {"n", "v"} },
        },
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = { automatic_installation = true },
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
		config = config,
		  -- stylua: ignore
        keys = {
            { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
            { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
            { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
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
            { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
            { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Clear breakpoints" },
        },
	},
}
