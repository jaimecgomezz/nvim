return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			json = { "jq" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			svelte = { "prettierd", "prettier" },
			graphql = { "prettierd", "prettier" },
			ruby = { "rubocop" },
			bash = { "shfmt" },
			rust = { "rustfmt" },
			sql = { "sql_formatter" },
		},
	},
	-- stylua: ignore
	keys = {
		{ "<leader>bf", function() require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 2000 }) end, desc = "Format buffer", },
	},
}
