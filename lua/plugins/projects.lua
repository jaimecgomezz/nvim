return {
  "benwainwright/fzf-project",
  lazy = false,
  dependencies = {
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "tpope/vim-fugitive",
  },
  init = function()
    vim.g.fzfSwitchProjectProjectDepth = 2
    vim.g.fzfSwitchProjectAlwaysChooseFile = 0
    vim.g.fzfSwitchProjectGitInitBehavior = "none"
    vim.g.fzfSwitchProjectWorkspaces = { "~/repos" }
  end,
  keys = {
    { "<leader>fp", "<CMD> FzfSwitchProject <CR>", desc = "Find projects" },
  },
}
