local function return_to_buffer(prevbuff, termbuff)
	-- Enter the buffer we were at prior to entering our terminal
	if vim.fn.buflisted(prevbuff) == 1 and prevbuff ~= termbuff then
		vim.cmd("buffer" .. prevbuff)
		return
	end

	-- If the buffer we were at prior to entering our terminal isn't listed
	-- anymore, attempt to enter any of the lastly edited buffers
	for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(buffer) == 1 and buffer ~= termbuff then
			vim.cmd("silent buffer" .. buffer)
			return
		end
	end

	-- Assume there's no other listed buffer and open start page
	vim.cmd.Startify()
end

local function exit_terminal(prevbuff, curbuff, termbuff)
	-- Prevent creating/entering out terminal if within another terminal, like a
	-- REPL, Overseer console, Toggleterm, etc
	if curbuff ~= termbuff then
		return
	end

	return_to_buffer(prevbuff, termbuff)
end

local function enter_terminal(currbuff, termbuff)
	-- Switch to existing terminal buffer
	if vim.fn.buflisted(termbuff) == 1 then
		vim.cmd("silent buffer" .. termbuff)
		vim.cmd.startinsert()
	else
		-- Create a terminal buffer
		vim.cmd("silent terminal")

		vim.g.termbuff = vim.api.nvim_get_current_buf()
		vim.cmd.startinsert()
	end
end

local function toggle_terminal()
	local prevbuff = vim.g.prevbuff
	local termbuff = vim.g.termbuff
	local currbuff = vim.api.nvim_get_current_buf()

	if vim.bo.buftype == "terminal" then
		exit_terminal(prevbuff, currbuff, termbuff)
	else
		vim.g.prevbuff = currbuff
		enter_terminal(currbuff, termbuff)
	end
end

local function kill_terminal()
	-- Do nothing if there's no terminal event set
	if not vim.g.termbuff then
		return
	end

	-- Attempt to delete terminal buffer
	pcall(vim.cmd, "silent! bdelete! " .. vim.g.termbuff)

	-- Wipe termbuff variable
	vim.g.termbuff = nil

	return_to_buffer(vim.g.prevbuff, vim.g.termbuff)
end

return {
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false,
		priority = 1001,
		-- stylua: ignore
		keys = {
            { "<C-;>", toggle_terminal,  desc = "Toggle term", mode = { "n", "t" }},
            { "<C-S-;>", kill_terminal, desc = "Kill term", mode = { "n", "t" }},
            { "<C-w>h", [[<C-\><C-n><C-W>h]], desc = "Move left window", mode = { "t" } },
            { "<C-w>j", [[<C-\><C-n><C-W>j]], desc = "Move bottom window", mode = { "t" } },
            { "<C-w>k", [[<C-\><C-n><C-W>k]], desc = "Move upper window", mode = { "t" } },
            { "<C-w>l", [[<C-\><C-n><C-W>l]], desc = "Move right window", mode = { "t" } },
            { "<A-h>", [[<C-\><C-n><C-W>h]], desc = "Move left window", mode = { "t" } },
            { "<A-j>", [[<C-\><C-n><C-W>j]], desc = "Move bottom window", mode = { "t" } },
            { "<A-k>", [[<C-\><C-n><C-W>k]], desc = "Move upper window", mode = { "t" } },
            { "<A-l>", [[<C-\><C-n><C-W>l]], desc = "Move right window", mode = { "t" } },
            { "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode", mode = { "t" }, },
        },
	},
}
