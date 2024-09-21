return {
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				enable_autocmd = false,
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"danymat/neogen",
		opts = {
			snippet_engine = "luasnip",
			placeholders_text = {
				["description"] = "description",
				["tparam"] = "tparam",
				["parameter"] = "parameter",
				["return"] = "return",
				["class"] = "class",
				["throw"] = "throw",
				["varargs"] = "varargs",
				["type"] = "type",
				["attribute"] = "attribute",
				["args"] = "args",
				["kwargs"] = "kwargs",
			},
		},
		-- stylua: ignore
		keys = {
			{ "gcg", function() require('neogen').generate() end, desc = "Generate Annotations (Neogen)" },
		},
	},
}
