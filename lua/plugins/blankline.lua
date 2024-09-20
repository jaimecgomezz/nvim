return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local ibl = require("ibl")
		local hooks = require("ibl.hooks")

		ibl.setup({
			exclude = {
				buftypes = { "terminal" },
				filetypes = {
					"help",
					"terminal",
					"lazy",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
					"mason",
					"nvdash",
					"nvcheatsheet",
					"startify",
					"fugitive",
				},
			},
			scope = {
				enabled = false,
			},
		})

		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
	end,
}
