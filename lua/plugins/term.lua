return {
	{
		"akinsho/toggleterm.nvim",
		lazy = false,
		opts = {
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.5
				end
			end,
			open_mapping = [[<C-;>]],
			shading_factor = "1",
			persist_size = false,
			direction = "vertical",
			autochdir = true,
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		},
		-- stylua: ignore
		keys = {
			{ "<A-h>", [[<C-\><C-n><C-W>h]], desc = "Move left window", mode = { "t" } },
			{ "<A-j>", [[<C-\><C-n><C-W>j]], desc = "Move bottom window", mode = { "t" } },
			{ "<A-k>", [[<C-\><C-n><C-W>k]], desc = "Move upper window", mode = { "t" } },
			{ "<A-l>", [[<C-\><C-n><C-W>l]], desc = "Move right window", mode = { "t" } },
			{ "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode", mode = { "t" }, },
		},
	},
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false,
		priority = 1001,
		opts = function()
			---@type Terminal?
			local saved_terminal

			return {
				window = {
					open = "alternate",
				},
				callbacks = {
					should_block = function(argv)
						return vim.tbl_contains(argv, "-b") or vim.tbl_contains(argv, "-d")
					end,
					pre_open = function()
						local term = require("toggleterm.terminal")
						local termid = term.get_focused_id()
						saved_terminal = term.get(termid)
					end,
					post_open = function(bufnr, winnr, ft, is_blocking)
						if is_blocking and saved_terminal then
							saved_terminal:close()
						else
							vim.api.nvim_set_current_win(winnr)
						end

						if ft == "gitcommit" or ft == "gitrebase" then
							vim.api.nvim_create_autocmd("BufWritePost", {
								buffer = bufnr,
								once = true,
								callback = vim.schedule_wrap(function()
									vim.api.nvim_buf_delete(bufnr, {})
								end),
							})
						end
					end,
					block_end = function()
						vim.schedule(function()
							if saved_terminal then
								saved_terminal:open()
								saved_terminal = nil
							end
						end)
					end,
				},
			}
		end,
	},
}
