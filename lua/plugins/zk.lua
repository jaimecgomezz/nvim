return {
	"zk-org/zk-nvim",
	config = function()
		require("zk").setup({
			picker = "telescope",
		})
	end,
	-- stylua: ignore
	keys = {
        { "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = "Open notes" },
		{ "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", desc = "New note" },
        { "<leader>zt", "<Cmd>ZkTags<CR>", desc = "Open notes matching tags" },
        { "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", desc = "Search for notes" },
	},
	init = function()
		local ok, telescope = pcall(require, "telescope")
		if ok then
			require("telescope").load_extension("zk")
		end
	end,
}
