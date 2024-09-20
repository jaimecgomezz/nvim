return {
	"mbbill/undotree",
	init = function()
		vim.g.undotree_WindowLayout = 2
		vim.g.undotree_SplitWidth = 60
		vim.g.undotree_DiffpanelHeight = 20
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
	keys = {
		{ "<localleader>u", "<cmd>UndotreeToggle<cr>", desc = "Open undotree" },
	},
}
