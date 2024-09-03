-- sources:
--      - https://vi.stackexchange.com/a/43436
--      - https://github.com/exosyphon/nvim/blob/main/lua/plugins/lsp.lua

local hover_close = function(base_win_id)
    local windows = vim.api.nvim_tabpage_list_wins(0)
    for _, win_id in ipairs(windows) do
        if win_id ~= base_win_id then
            local win_cfg = vim.api.nvim_win_get_config(win_id)
            if win_cfg.relative == "win" and win_cfg.win == base_win_id then
                vim.api.nvim_win_close(win_id, {})
                break
            end
        end
    end
end

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true }

    vim.keymap.set(
        "n",
        "gr",
        function() vim.lsp.buf.references() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" })
    )

    vim.keymap.set(
        "n",
        "gd",
        function() vim.lsp.buf.definition() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" })
    )

    vim.keymap.set(
        "n",
        "K",
        function() vim.lsp.buf.hover() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" })
    )

    vim.keymap.set(
        "n",
        "<Esc>",
        function() hover_close(vim.api.nvim_get_current_win()) end,
        vim.tbl_deep_extend("force", opts, { desc = "Close active lsp hover popup" })
    )

    vim.keymap.set(
        "n",
        "<leader>vws",
        function() vim.lsp.buf.workspace_symbol() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" })
    )

    vim.keymap.set(
        "n",
        "<leader>vd",
        function() vim.diagnostic.setloclist() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" })
    )

    vim.keymap.set(
        "n",
        "[d",
        function() vim.diagnostic.goto_next() end,
        vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" })
    )

    vim.keymap.set(
        "n",
        "]d",
        function() vim.diagnostic.goto_prev() end,
        vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" })
    )

    vim.keymap.set(
        "n",
        "<leader>vca",
        function() vim.lsp.buf.code_action() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" })
    )

    vim.keymap.set(
        "n",
        "<leader>vrr",
        function() vim.lsp.buf.references() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP References" })
    )

    vim.keymap.set(
        "n",
        "<leader>vrn",
        function() vim.lsp.buf.rename() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" })
    )

    vim.keymap.set(
        "i",
        "<C-h>",
        function() vim.lsp.buf.signature_help() end,
        vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" })
    )
end

local config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local handlers = {
        ["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = "single",
                title = "hover",
                max_width = 80,
            }),

        ["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = "single",
                title = "hover",
                max_width = 80,
            })
    }

    local opts = {
        handlers = handlers,
        on_attach = on_attach,
        capabilities = capabilities,
    }

    lspconfig.lua_ls.setup(opts)
    lspconfig.solargraph.setup(opts)
    lspconfig.rust_analyzer.setup(opts)
end

return ({
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function() require("mason").setup() end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
            'jq',
            'shfmt',
            'prettier',
            'prettierd',
            'stylua',
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
            ensure_installed = {
                'lua_ls',
                'rubocop',
                'solargraph',
                'rust_analyzer',
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = config,
    },
})
