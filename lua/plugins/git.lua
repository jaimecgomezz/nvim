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
		"echasnovski/mini.diff",
		version = "*",
		opts = { view = { style = "sign" } },
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
}
