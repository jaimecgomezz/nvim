local function config()
	local Hydra = require("hydra")

	local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

	Hydra({
		name = "Draw Diagram",
		hint = hint,
		config = {
			color = "pink",
			invoke_on_body = true,
			hint = { border = "rounded" },
		},
		mode = "n",
		body = "<leader>v",
		heads = {
			{ "H", "<C-v>h:VBox<CR>" },
			{ "J", "<C-v>j:VBox<CR>" },
			{ "K", "<C-v>k:VBox<CR>" },
			{ "L", "<C-v>l:VBox<CR>" },
			{ "s", ":VBox<CR>", { mode = "v" } },
			{ "<Esc>", nil, { exit = true } },
		},
	})

	vim.keymap.set("n", "<leader>V", function()
		-- Open a new empty buffer and obtain info
		vim.cmd([[enew]])
		local bufnr = vim.fn.bufnr()
		local height = vim.api.nvim_win_get_height(0)

		-- Allow virtualedit
		vim.wo.virtualedit = "all"

		-- Fill buffer with empty lines
		local lines = {}
		for n = 1, height do
			lines[n] = ""
		end
		vim.api.nvim_buf_set_lines(0, 0, height, false, lines)

		-- Create autocmds to prevent automatic linebreaking
		vim.api.nvim_create_autocmd("BufWinEnter", {
			buffer = bufnr,
			callback = function()
				vim.o.textwidth = 0
			end,
		})

		vim.api.nvim_create_autocmd("BufWinLeave", {
			buffer = bufnr,
			callback = function()
				vim.o.textwidth = 80
			end,
		})
	end)
end

return {
	"jbyuki/venn.nvim",
	config = config,
}
