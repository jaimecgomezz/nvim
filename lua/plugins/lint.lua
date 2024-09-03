local config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
        lua = { "luacheck" },
        json = { "jsonlint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        ruby = { "rubocop" },
        markdown = { "markdownlint" },
        bash = { "shellcheck" },
        rust = { "ruff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd(
        { "BufEnter", "BufWritePost", "InsertLeave" },
        { group = lint_augroup, callback = function() lint.try_lint() end, }
    )

    vim.keymap.set(
        "n",
        "<leader>bl",
        function() lint.try_lint() end,
        { desc = "Trigger linting for current file" }
    )
end

return ({
    "mfussenegger/nvim-lint",
    config = config,
    event = { "BufReadPre", "BufNewFile", },
})