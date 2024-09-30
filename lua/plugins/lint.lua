return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = { "clangtidy" },
			cpp = { "clangtidy" },
			json = { "jsonlint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			ruby = { "rubocop" },
			markdown = { "markdownlint" },
			bash = { "shellcheck" },
			rust = { "ruff" },
			sql = {},
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint(nil, { ignore_errors = true })
			end,
		})

		vim.keymap.set("n", "<leader>bl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
