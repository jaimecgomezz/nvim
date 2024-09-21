-- source: https://github.com/catgoose/nvim/blob/main/lua/plugins/treesitter.lua

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"CKolkey/ts-node-action",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"csv",
					"diff",
					"go",
					"graphql",
					"json",
					"json5",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"python",
					"ruby",
					"rust",
					"sql",
					"svelte",
					"vim",
					"vimdoc",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				matchup = { enable = true },

				-- text objects manipulation
				textobjects = {
					lsp_interop = {
						enable = true,
						border = "rounded",
						floating_preview_opts = {},
					},
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["aC"] = "@call.outer",
							["iC"] = "@call.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ip"] = "@parameter.inner",
							["ap"] = "@parameter.outer",
							["ib"] = "@block.inner",
							["ab"] = "@block.outer",
							["il"] = "@loop.inner",
							["al"] = "@loop.outer",
							["ia"] = "@attribute.inner",
							["aa"] = "@attribute.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]f"] = "@function.outer",
							["]p"] = "@parameter.inner",
							["]b"] = "@block.outer",
							["]a"] = "@attribute.inner",
							["]l"] = "@loop.outer",
							["]m"] = "@this_method_call",
							["]s"] = { query = "@scope", query_group = "locals" },
							["]c"] = "@method_object_call",
							["]o"] = "@object_declaration",
							["]k"] = "@object_key",
							["]v"] = "@object_value",
							["]w"] = "@method_parameter",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[p"] = "@parameter.inner",
							["[b"] = "@block.outer",
							["[a"] = "@attribute.inner",
							["[l"] = "@loop.outer",
							["[m"] = "@this_method_call",
							["[s"] = { query = "@scope", query_group = "locals" },
							["[c"] = "@method_object_call",
							["[o"] = "@object_declaration",
							["[k"] = "@object_key",
							["[v"] = "@object_value",
							["[w"] = "@method_parameter",
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							["]P"] = "@parameter.inner",
							["]B"] = "@block.outer",
							["]A"] = "@attribute.inner",
							["]L"] = "@loop.outer",
							["]M"] = "@this_method_call",
							["]S"] = { query = "@scope", query_group = "locals" },
							["]C"] = "@method_object_call",
							["]O"] = "@object_declaration",
							["]K"] = "@object_key",
							["]V"] = "@object_value",
							["]W"] = "@method_parameter",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[P"] = "@parameter.inner",
							["[B"] = "@block.outer",
							["[A"] = "@attribute.inner",
							["[L"] = "@loop.outer",
							["[M"] = "@this_method_call",
							["[S"] = { query = "@scope", query_group = "locals" },
							["[C"] = "@method_object_call",
							["[O"] = "@object_declaration",
							["[K"] = "@object_key",
							["[V"] = "@object_value",
							["[W"] = "@method_parameter",
						},
					},
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
						init_selection = "<C-y>",
						scope_incremental = "<C-v>",
					},
				},
			})
		end,
	},
}
