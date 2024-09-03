-- sources:
--      - https://github.com/catgoose/nvim/blob/main/lua/plugins/cmp.lua

local config = function(_, _)
	local cmp = require("cmp")
	local lspkind = require("lspkind")

	local source_mapping = {
		nvim_lsp = "[LSP]",
		nvim_lua = "[LUA]",
		luasnip = "[SNIP]",
		buffer = "[BUF]",
		path = "[PATH]",
		treesitter = "[TREE]",
		["vim-dadbod-completion"] = "[DB]",
		codeium = "[CODE]",
		dap = "[DAP]",
	}

	cmp.setup({
		preselect = cmp.PreselectMode.None,
		keyword_length = 2,
		completion = {
			completeopt = "menu,menuone,noselect,noinsert",
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				ellipsis_char = "...",
				menu = source_mapping,
			}),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
			{ name = "path" },
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end,
				},
			},
		},
		mapping = {
			["<C-e>"] = cmp.mapping.abort(),
			["<C-n>"] = cmp.mapping(
				cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				{ "i", "c" }
			),
			["<C-p>"] = cmp.mapping(
				cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				{ "i", "c" }
			),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
						""
					)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				else
					fallback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
		},
	})

	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	})

	cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"windwp/nvim-autopairs",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = config,
}
