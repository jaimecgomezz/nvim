local config = function()
    local conform = require("conform")

    conform.setup({
        format_on_save = {
            timeout_ms = 2000,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            json = { { "jq" } },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            graphql = { { "prettierd", "prettier" } },
            ruby = { "rubocop" },
            markdown = { { "prettierd", "prettier" } },
            bash = { "shfmt" },
            rust = { "rustfmt" },
        },
    })

    vim.keymap.set(
        { "n", "v" },
        "<leader>bf",
        function() conform.format({ lsp_fallback = true, async = false, timeout_ms = 2000, }) end,
        { desc = "Format file or range (in visual mode)" }
    )
end

return ({
    'stevearc/conform.nvim',
    config = config,
})
