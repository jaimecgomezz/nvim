-- TODO:
--  - toggle git status

return {
	{
		"tpope/vim-fugitive",
		-- stylua: ignore
		keys = {
			{ "<leader>gg", "<CMD> vertical Git <CR>", desc = "Open fugitive" },
			{ "<leader>gc", "<CMD> Git commit <CR>", desc = "Git commit" },
			{ "<leader>gp", "<CMD> Git pull <CR>", desc = "Git pull" },
			{ "<leader>gs", "<CMD> Git stash <CR>", desc = "Git stash" },
			{ "<leader>gS", "<CMD> Git stash pop <CR>", desc = "Git stash pop" },
			{ "<leader>gP", "<CMD> Git push <CR>", desc = "Git push" },
            { "<leader>gB", "<CMD> vertical Git branch <CR>", desc = "Git pull" },
			{ "<leader>gl", "<CMD> vertical Git log -- % <CR>", desc = "Commit" },
            { "<leader>gL", "<CMD> vertical Git log <CR>", desc = "Commit" },
			{ "<leader>gd", "<CMD> vertical Git diff -- % <CR>", desc = "Diff file" },
            { "<leader>gD", "<CMD> vertical Git diff <CR>", desc = "Diff project" },
			{ "<Tab>", "=", ft = "fugitive", remap = true },
			{ "<BS>", "<", ft = "fugitive", remap = true },
			{ "q", "<CMD> close <CR>", ft = { "fugitive", "git" }, noremap = true },
			{ "<leader>gG", function ()
                vim.ui.input({ prompt = "Git command: " }, function(command)
                    if command ~= nil and command ~= "" then
                        cmd = "vertical Git " .. command
                        vim.cmd(cmd)
                    end
                end)
			end, desc = "Run git command" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {},
		-- stylua: ignore
		keys = {
            { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" } },
			{ "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
			{ "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
            { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
			{ "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
			{ "<leader>hS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
			{ "<leader>hR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
			{ "<leader>gb", function() require("gitsigns").blame_line({ full = true, ignore_whitespace = true }) end, desc = "Git blame line" },
			{ "<leader>hd", function() require("gitsigns").diffthis() end, desc = "Diff hunk" },
			{ "<leader>hD", function() require("gitsigns").diffthis("~") end, desc = "Diff buffer" },
			{ "<leader>hx", function() require("gitsigns").toggle_deleted() end, desc = "Toggle deleted hunks" },
			{ "<leader>hs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Stage hunk (visual)", mode = { "v" } },
			{ "<leader>hr", function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Reset hunk (visual)", mode = { "v" } },
			{ "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]h", bang = true })
					else
						require("gitsigns").nav_hunk("next")
					end
				end, desc = "Next diff hunk" },
			{ "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[h", bang = true })
					else
						require("gitsigns").nav_hunk("prev")
					end
				end, desc = "Next diff hunk" },
		},
	},
}
