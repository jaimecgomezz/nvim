local function toggle_terminal()
	local lastbuff = vim.fn.bufnr("#")
	local termbuff = vim.g.termbuff
	local currbuff = vim.api.nvim_get_current_buf()

	-- Create terminal if not exists
	if not termbuff then
		vim.cmd.terminal()
		vim.g.prevbuff = currbuff
		vim.g.termbuff = vim.api.nvim_get_current_buf()

	-- Open last edited buffer if we're in terminal
	elseif currbuff == termbuff then
		if vim.fn.buflisted(vim.g.prevbuff) == 1 then
			vim.cmd("buffer" .. vim.g.prevbuff)

		-- Open the last edited buffer
		elseif vim.fn.buflisted(lastbuff) == 1 then
			vim.cmd("buffer" .. lastbuff)
		end

		vim.g.prevbuff = nil

		-- Handle no other buffers listed with start page
		if vim.api.nvim_get_current_buf() == termbuff then
			vim.cmd.Startify()
		end

	-- Open terminal if we're not in it
	else
		vim.cmd("buffer" .. tostring(termbuff))
		vim.g.prevbuff = currbuff
		vim.cmd.startinsert()
	end
end

local function kill_terminal()
	local lastbuff = vim.fn.bufnr("#")
	local termbuff = vim.g.termbuff
	local currbuff = vim.api.nvim_get_current_buf()

	if not termbuff then
		return
	end

	vim.g.termbuff = nil
	pcall(vim.cmd, "silent! bdelete! " .. termbuff)

	if currbuff == termbuff then
		-- Open the buffer prior to switching to terminal
		if vim.fn.buflisted(vim.g.prevbuff) == 1 then
			vim.cmd("buffer" .. vim.g.prevbuff)

		-- Open the last edited buffer
		elseif vim.fn.buflisted(lastbuff) == 1 then
			vim.cmd("buffer" .. lastbuff)

		-- Open Start page
		else
			vim.cmd.Startify()
		end
	end
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
			{ "<A-h>", [[<C-\><C-n><C-W>h]], desc = "Move left window", mode = { "t" } },
			{ "<A-j>", [[<C-\><C-n><C-W>j]], desc = "Move bottom window", mode = { "t" } },
			{ "<A-k>", [[<C-\><C-n><C-W>k]], desc = "Move upper window", mode = { "t" } },
			{ "<A-l>", [[<C-\><C-n><C-W>l]], desc = "Move right window", mode = { "t" } },
			{ "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode", mode = { "t" }, },
        },
	},
}
