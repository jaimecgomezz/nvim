local config = function()
	require("notify").setup({
		fps = 60,
		render = "compact",
		stages = "fade",
	})
end

return {
	"rcarriga/nvim-notify",
	config = config,
}
