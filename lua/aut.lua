-- Always open help pages in a left vertical split.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function()
		vim.cmd.wincmd("L")
	end,
})

-- Close certain files with `q`
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "help", "qf", "fugitive", "git" },
	callback = function(event)
		local buffer = vim.api.nvim_get_current_buf()

		if vim.o.filetype == "help" then
			vim.keymap.set("n", "q", vim.cmd.bd, { desc = "Close", buffer = buffer })
		else
			vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close", buffer = buffer })
		end
	end,
})

-- Close terminals with `q`
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close", buffer = vim.api.nvim_get_current_buf() })
	end,
})

-- Dynamicalle create missing dirs on write
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		local dirname = vim.fs.dirname(event.match)
		vim.fn.mkdir(dirname, "p", tonumber("0755", 8))
	end,
})
