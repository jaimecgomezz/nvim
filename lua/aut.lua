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
	callback = function()
		if vim.o.filetype == "help" then
			vim.keymap.set("n", "q", vim.cmd.bd, { desc = "Close" })
		else
			vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close" })
		end
	end,
})

-- Dynamicalle create missing dirs on write
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		local dirname = vim.fs.dirname(event.match)
		vim.fn.mkdir(dirname, "p", tonumber("0755", 8))
	end,
})