return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"olimorris/neotest-rspec",
	},
	init = function()
		local neotest_ns = vim.api.nvim_create_namespace("neotest")

		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					-- Replace newline and tab characters with space for more compact diagnostics
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)
	end,
	opts = function()
		return {
			status = { virtual_text = true, signs = false },
			output = { enabled = true, open_on_run = true },
			adapters = {
				require("neotest-rspec")({
					rspec_cmd = function()
						return vim.tbl_flatten({
							"bundle",
							"exec",
							"rspec",
						})
					end,
				}),
			},
		}
	end,
	-- stylua: ignore
	keys = {
		{ "<leader>t", "", desc = "+test" },
		{ "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
		{ "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
		{ "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
		{ "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
		{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
		{ "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Show Output" },
		{ "<leader>tk", function() require("neotest").run.stop() end, desc = "Stop" },
		{ "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
	},
}
