local config = function()
	vim.keymap.set("n", "<localleader>q", "<CMD> copen <CR>", { desc = "Quickfix" })
end

return {
	"kevinhwang91/nvim-bqf",
	config = config,
}
