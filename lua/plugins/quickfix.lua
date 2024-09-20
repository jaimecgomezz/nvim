return {
	{
		"kevinhwang91/nvim-bqf",
		opts = {
			preview = {
				auto_preview = false,
				show_title = false,
				winblend = 0,
			},
		},
		keys = {
			{ "q", "<CMD> close <CR>", ft = "qf", noremap = true },
		},
	},
	{
		"stevearc/quicker.nvim",
		opts = {
			type_icons = {
				E = "E ",
				W = "W ",
				I = "I ",
				N = "N ",
				H = "H ",
			},
		},
		-- stylua: ignore
		keys = {
            { "<localleader>d", function() vim.diagnostic.setloclist({}) end,  desc = "Send diagnostic to loclist" },
            { "<localleader>q", function ()
				require("quicker").toggle({ focus = true, min_height = 10 })
            end, desc = "Toggle quickfix"  },
            { "<localleader>l", function ()
				require("quicker").toggle({ loclist = true, focus = true, min_height = 10 })
            end, desc = "Toggle loclist" },
        },
	},
}
