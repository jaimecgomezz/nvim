return {
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
