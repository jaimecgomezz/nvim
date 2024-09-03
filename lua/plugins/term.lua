local config_toggleterm = function()
	local toggleterm = require("toggleterm")

	toggleterm.setup({
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
	})

	vim.keymap.set(
		"t",
		"<C-x>",
		vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
		{ desc = "Escape terminal mode" }
	)

	vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-W>h]], { desc = "Move left window" })
	vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-W>j]], { desc = "Move bottom window" })
	vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-W>k]], { desc = "Move upper window" })
	vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-W>l]], { desc = "Move right window" })
end

local flatten_opts = function()
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
end

return {
	{
		"akinsho/toggleterm.nvim",
		config = config_toggleterm,
	},
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false,
		priority = 1001,
		opts = flatten_opts,
	},
}
