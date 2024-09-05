local config = function()
	local quicker = require("quicker")

	quicker.setup()

	vim.keymap.set("n", "<localleader>q", function()
		quicker.toggle({ focus = true, min_height = 10 })
	end, { desc = "Toggle quickfix" })

	vim.keymap.set("n", "<localleader>l", function()
		quicker.toggle({ loclist = true, focus = true, min_height = 10 })
	end, {
		desc = "Toggle loclist",
	})
end

return {
	{
		"kevinhwang91/nvim-bqf",
	},
	{
		"stevearc/quicker.nvim",
		config = config,
	},
}
