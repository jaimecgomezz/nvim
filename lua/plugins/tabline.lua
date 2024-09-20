return {
	"nanozuki/tabby.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		preset = "tab_only",
		option = {
			nerdfont = true,
		},
	},
    -- stylua: ignore
	keys = {
        { "<leader>wr", function()
			vim.ui.input({ prompt = "Raname to: " }, function(input)
				local cmd = ("Tabby rename_tab %s"):format(input or "unnamed")

				vim.cmd(cmd)
			end)
		end,  desc = "Go to tab" },
        { "<leader>wa", "<CMD> $tabnew<CR>",  noremap = true },
        { "<leader>wq", "<CMD> tabclose<CR>",  noremap = true },
        { "<leader>wo", "<CMD> tabonly<CR>",  noremap = true },
        { "<leader>wn", "<CMD> tabn<CR>", noremap = true },
        { "<leader>wp", "<CMD> tabp<CR>", noremap = true },
        { "<leader>wh", "<CMD> -tabmove<CR>", noremap = true },
        { "<leader>wl", "<CMD> +tabmove<CR>", noremap = true },
        { "<leader>wg", "<CMD> Tabby jump_to_tab <CR>", desc = "Pick tab" },
    }
,
}
