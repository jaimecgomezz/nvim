local function config_signs()
	require("gitsigns").setup({
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]h", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[h", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- Actions
			map("n", "<leader>hs", gitsigns.stage_hunk)
			map("n", "<leader>hr", gitsigns.reset_hunk)
			map("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			map("n", "<leader>hu", gitsigns.undo_stage_hunk)
			map("n", "<leader>hp", gitsigns.preview_hunk)
			map("n", "<leader>hS", gitsigns.stage_buffer)
			map("n", "<leader>hR", gitsigns.reset_buffer)
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end)
			map("n", "<leader>hd", gitsigns.diffthis)
			map("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end)
			map("n", "<leader>hx", gitsigns.toggle_deleted)

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	})

	vim.keymap.set("n", "<leader>gd", "<CMD> Gitsigns toggle_signs <CR>", { desc = "Toggle git sigs" })
end

local config = function()
	local neogit = require("neogit")

	neogit.setup({
		graph_style = "ascii",
		telescope_sorter = function()
			return require("telescope").extensions.fzf.native_fzf_sorter()
		end,
		-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
		-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
		auto_refresh = true,
		-- Value used for `--sort` option for `git branch` command
		-- By default, branches will be sorted by commit date descending
		-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
		-- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
		sort_branches = "-committerdate",
		kind = "auto",
	})

	vim.keymap.set("n", "<leader>gg", [[<CMD> Neogit <CR>]], { desc = "Open neogit interface" })
end

return {
	{
		"FabijanZulj/blame.nvim",
		opts = { blame_options = { "-w", "-CCC" } },
		keys = { { "<leader>gb", "<CMD> BlameToggle<CR>", desc = "Git blame window" } },
	},
	{
		"junegunn/gv.vim",
		keys = {
			{ "<leader>gl", "<CMD> GV! <CR>", desc = "List file commits" },
			{ "<leader>gL", "<CMD> GV <CR>", desc = "List project commits" },
		},
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = config,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = config_signs,
	},
}
