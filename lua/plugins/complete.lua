-- sources:
--      - https://github.com/catgoose/nvim/blob/main/lua/plugins/cmp.lua

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
		"rcarriga/cmp-dap",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			preselect = cmp.PreselectMode.None,
			completion = {
				completeopt = "menu,menuone,noselect,noinsert",
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					ellipsis_char = "...",
					menu = {
						nvim_lsp = "[LSP]",
						nvim_lua = "[LUA]",
						luasnip = "[SNIP]",
						buffer = "[BUF]",
						path = "[PATH]",
						treesitter = "[TREE]",
						["vim-dadbod-completion"] = "[DB]",
						dap = "[DAP]",
					},
				}),
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
			view = {
				entries = {
					name = "custom",
					follow_cursor = true,
				},
			},
			sources = {
				{
					name = "nvim_lsp",
				},
				{
					name = "luasnip",
					option = { use_show_condition = true },
					entry_filter = function()
						local context = require("cmp.config.context")
						return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
					end,
				},
				{
					name = "buffer",
					option = {
						get_bufnrs = function()
							local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
							return vim.tbl_keys(bufs)
						end,
					},
				},
				{
					name = "lazydev",
					entry_filter = function()
						if vim.bo.filetype ~= "lua" then
							return false
						end
						return true
					end,
				},
				{ name = "path" },
				{ name = "treesitter" },
				{ name = "nvim_lua" },
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			mapping = {
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
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

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},
		})

		cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
			sources = cmp.config.sources({
				{ name = "dap" },
			}, {
				{ name = "buffer" },
			}),
		})

		cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
	end,
}
