return {
	"rhysd/reply.vim",
	cmd = { "Repl", "ReplAuto" },
	keys = {
		{ "<leader>ra", "<CMD> ReplAuto <CR>", desc = "Open RPL", mode = { "n" } },
		{ "<leader>rr", "<CMD> Repl <CR>", desc = "Open RPL", mode = { "n" } },
		{ "<leader>rr", "<CMD>'<,'> Repl <CR>", desc = "Open RPL", mode = { "v" } },
		{ "<leader>rs", "<CMD> ReplSend <CR>", desc = "Open RPL", mode = { "n" } },
		{ "<leader>rs", "<CMD>'<,'> ReplSend <CR>", desc = "Open RPL", mode = { "v" } },
		{ "<leader>rl", "<CMD> ReplList <CR>", desc = "List RPLs", mode = { "n" } },
		{ "<leader>rk", "<CMD> ReplStop <CR>", desc = "Stop RPL", mode = { "n" } },
	},
}
