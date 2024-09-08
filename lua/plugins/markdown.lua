return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			heading = {
				enabled = true,
				sign = false,
				position = "overlay",
				width = "block",
				min_width = 80,
			},
			code = {
				style = "language",
				sign = false,
				min_width = 80,
				border = "thick",
				width = "block",
			},
			checkbox = {
				unchecked = { icon = "◯ " },
				checked = { icon = "✔ " },
			},
			sign = { enabled = false },
			indent = { enabled = true },
			quote = { repeat_linebreak = true },
			win_options = {
				showbreak = { default = "", rendered = "  " },
				breakindent = { default = false, rendered = true },
				breakindentopt = { default = "", rendered = "" },
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.g.mkdp_combine_preview = 1
			vim.g.mkdp_combine_preview_auto_refresh = 1

			vim.keymap.set("n", "<localleader>p", "<CMD> MarkdownPreview <CR>", { desc = "Preview MD" })
		end,
	},
}
