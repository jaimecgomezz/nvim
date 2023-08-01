return {
    "benwainwright/fzf-project",
    dependencies = {'junegunn/fzf', 'junegunn/fzf.vim'},
    config = function()
        vim.g.fzfSwitchProjectAlwaysChooseFile = 0
        vim.g.fzfSwitchProjectGitInitBehavior = "none"
        vim.g.fzfSwitchProjectWorkspaces = {
            "~/repos/jaimecgomezz", "~/repos/aleph", "~/repos/foreign"
        }
    end
}
