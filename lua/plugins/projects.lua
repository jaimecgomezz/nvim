return {
	"benwainwright/fzf-project",
	dependencies = {
		"junegunn/fzf",
		"junegunn/fzf.vim",
		"tpope/vim-fugitive",
	},
	config = function()
		vim.g.fzfSwitchProjectProjectDepth = 5
		vim.g.fzfSwitchProjectAlwaysChooseFile = 0
		vim.g.fzfSwitchProjectGitInitBehavior = "none"
		vim.g.fzfSwitchProjectWorkspaces = { "~/repos" }

		vim.keymap.set("n", "<leader>fp", [[<CMD> FzfSwitchProject <CR>]], { desc = "Find projects" })
	end,
}
