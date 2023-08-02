local M = {}

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

M.handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = {
            {"╭", "CmpDocBorder"}, {"─", "CmpDocBorder"},
            {"╮", "CmpDocBorder"}, {"│", "CmpDocBorder"},
            {"╯", "CmpDocBorder"}, {"─", "CmpDocBorder"},
            {"╰", "CmpDocBorder"}, {"│", "CmpDocBorder"}
        }
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
                                                      .signature_help, {
        border = {
            {"╭", "CmpDocBorder"}, {"─", "CmpDocBorder"},
            {"╮", "CmpDocBorder"}, {"│", "CmpDocBorder"},
            {"╯", "CmpDocBorder"}, {"─", "CmpDocBorder"},
            {"╰", "CmpDocBorder"}, {"│", "CmpDocBorder"}
        }
    })
}

M.on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    if client.supports_method("textDocument/semanticTokens") then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

M.capabilities = {
    textDocument = {
        completion = {
            dynamicRegistration = false,
            completionItem = {
                snippetSupport = true,
                commitCharactersSupport = true,
                deprecatedSupport = true,
                preselectSupport = true,
                tagSupport = {
                    valueSet = {
                        1 -- Deprecated
                    }
                },
                insertReplaceSupport = true,
                resolveSupport = {
                    properties = {
                        "documentation", "detail", "additionalTextEdits",
                        "sortText", "filterText", "insertText", "textEdit",
                        "insertTextFormat", "insertTextMode"
                    }
                },
                insertTextModeSupport = {
                    valueSet = {
                        1, -- asIs
                        2 -- adjustIndentation
                    }
                },
                labelDetailsSupport = true
            },
            contextSupport = true,
            insertTextMode = 1,
            completionList = {
                itemDefaults = {
                    'commitCharacters', 'editRange', 'insertTextFormat',
                    'insertTextMode', 'data'
                }
            }
        }
    }
}

M.settings = {
    Lua = {
        diagnostics = {globals = {"vim"}},
        workspace = {
            library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true
            },
            maxPreload = 100000,
            preloadFileSize = 10000
        }
    },
    ['rust-analyzer'] = {cargo = {allFeatures = true}}
}

return {
    "neovim/nvim-lspconfig",
    M = M,
    config = function()
        local configs = require("lspconfig")

        configs.lua_ls.setup(M)
        configs.pyright.setup(M)
        configs.ruff_lsp.setup(M)
        configs.solargraph.setup(M)
    end
}
