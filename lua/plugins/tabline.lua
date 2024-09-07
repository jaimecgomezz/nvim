local function config()
	require("tabby").setup({
		preset = "tab_only",
		option = {
			nerdfont = true,
			lualine_theme = "catppuccin", -- lualine theme name
		},
	})

	vim.keymap.set("n", "<leader>wr", function()
		vim.ui.input({ prompt = "Raname to: " }, function(input)
			local cmd = ("Tabby rename_tab %s"):format(input or "unnamed")

			vim.cmd(cmd)
		end)
	end, { desc = "Go to tab" })

	vim.keymap.set("n", "<leader>wg", "<CMD> Tabby jump_to_tab <CR>", { desc = "Pick tab" })

	vim.keymap.set("n", "<leader>wa", "<CMD> $tabnew<CR>", { noremap = true })
	vim.keymap.set("n", "<leader>wq", "<CMD> tabclose<CR>", { noremap = true })
	vim.keymap.set("n", "<leader>wo", "<CMD> tabonly<CR>", { noremap = true })
	vim.keymap.set("n", "<leader>wn", "<CMD> tabn<CR>", { noremap = true })
	vim.keymap.set("n", "<leader>wp", "<CMD> tabp<CR>", { noremap = true })
	vim.keymap.set("n", "<leader>wh", "<CMD> -tabmove<CR>", { noremap = true })
	vim.keymap.set("n", "<leader>wl", "<CMD> +tabmove<CR>", { noremap = true })
end

return {
	"nanozuki/tabby.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = config,
}
