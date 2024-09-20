-- sources:
--      - https://vi.stackexchange.com/a/43436
--      - https://github.com/exosyphon/nvim/blob/main/lua/plugins/lsp.lua

local hover_close = function(base_win_id)
	local windows = vim.api.nvim_tabpage_list_wins(0)
	for _, win_id in ipairs(windows) do
		if win_id ~= base_win_id then
			local win_cfg = vim.api.nvim_win_get_config(win_id)
			if win_cfg.relative == "win" and win_cfg.win == base_win_id then
				vim.api.nvim_win_close(win_id, true)
				break
			end
		end
	end
end

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }

	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))

	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))

	vim.keymap.set("i", "<C-s>", function()
		vim.lsp.buf.signature_help()
	end, { desc = "LSP signature help" })

	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))

	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.setloclist()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))

	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next({ float = { border = "rounded" } })
	end, vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))

	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev({ float = { border = "rounded" } })
	end, vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))

	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))

	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))

	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))

	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))

	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		buffer = bufnr,
		callback = function()
			for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.api.nvim_win_get_config(winid).zindex then
					return
				end
			end

			vim.diagnostic.open_float()
		end,
	})
end

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			"jq",
			"shfmt",
			"prettier",
			"prettierd",
			"stylua",
			"jsonlint",
			"luacheck",
			"markdownlint",
			"shellcheck",
			"sqlfluff",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"sqls",
				"lua_ls",
				"rubocop",
				"solargraph",
				"rust_analyzer",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "nanotee/sqls.nvim" },
		config = function()
			local lspconfig = require("lspconfig")

			local opts = {
				on_attach = on_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				handles = {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
						border = "single",
						title = "hover",
						max_width = 80,
					}),

					["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
						border = "single",
						title = "hover",
						max_width = 80,
					}),
				},
			}

			lspconfig.lua_ls.setup(opts)
			lspconfig.solargraph.setup(opts)
			lspconfig.rust_analyzer.setup(opts)
			lspconfig.svelte.setup(opts)
			lspconfig.sqls.setup(vim.tbl_extend("force", opts, {
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)
					require("sqls").on_attach(client, bufnr)
				end,
			}))
		end,
	},
}
