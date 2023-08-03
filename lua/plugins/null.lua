return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            debug = true,
            sources = {
                diagnostics.luacheck, formatting.lua_format, -- lua
                diagnostics.rubocop.with({
                    command = {"bundle", "exec", "rubocop"}
                }), -- Ruby
                formatting.rubocop.with({
                    command = {"bundle", "exec", "rubocop"}
                }), -- Ruby
                diagnostics.ruff, diagnostics.mypy, formatting.black, -- Python
                formatting.clang_format
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                timeout_ms = 2000
                            })
                        end
                    })
                end
            end
        })
    end
}
