local function toggle_terminal()
	local termbuff = vim.g.termbuff
	local currbuff = vim.api.nvim_get_current_buf()

	-- Create terminal if not exists
	if not termbuff then
		vim.cmd.terminal()
		vim.g.termbuff = vim.api.nvim_get_current_buf()
		vim.cmd.startinsert()

	-- Open last edited buffer if we're in terminal
	elseif currbuff == termbuff then
		pcall(vim.cmd, "silent! buffer#")

		-- Handle no other buffers listed with start page
		if vim.api.nvim_get_current_buf() == termbuff then
			vim.cmd.Startify()
		end

	-- Open terminal if we're not in it
	else
		vim.cmd("buffer" .. tostring(termbuff))
		vim.cmd.startinsert()
	end
end

local function kill_terminal()
	local prevbuff = vim.fn.bufnr("#")
	local termbuff = vim.g.termbuff
	local currbuff = vim.api.nvim_get_current_buf()

	if not termbuff then
		return
	end

	vim.g.termbuff = nil
	pcall(vim.cmd, "silent! bdelete! " .. termbuff)

	if currbuff == termbuff then
		if vim.fn.buflisted(prevbuff) == 1 then
			vim.cmd("buffer" .. prevbuff)
		else
			vim.cmd.Startify()
		end
	end
end

vim.keymap.set({ "n", "t" }, "<C-;>", toggle_terminal, { desc = "Toggle term" })
vim.keymap.set({ "n", "t" }, "<C-S-;>", kill_terminal, { desc = "Kill term" })
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-W>h]], { desc = "Move left" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-W>j]], { desc = "Move down" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-W>k]], { desc = "Move up" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-W>l]], { desc = "Move right" })
vim.keymap.set(
	"t",
	"<C-x>",
	vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
	{ desc = "Escape terminal mode" }
)
