local config = function()
	require("noice").setup({
		messages = { enabled = false },
		popupmenu = { enabled = true, backend = "cmp" },
		notify = { enabled = true },
		redirect = {
			view = "popup",
		},
		lsp = {
			override = {
				-- override the default lsp markdown formatter with Noice
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				-- override the lsp markdown formatter with Noice
				["vim.lsp.util.stylize_markdown"] = false,
				-- override cmp documentation with Noice (needs the other options to work)
				["cmp.entry.get_documentation"] = false,
			},
			hover = {
				enabled = true,
				silent = true, -- NOT WORKING
			},
			signature = {
				enabled = true,
				auto_open = { enabled = false },
			},
			message = {
				enabled = true,
				view = "notify",
			},
		},
		presets = {
			bottom_search = false, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = false, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		views = {
			hover = { border = { style = "single" } },
			confirm = { border = { style = "single" } },
			popup = { border = { style = "single" } },
		},
	})

	vim.keymap.set("c", "<S-Enter>", function()
		require("noice").redirect(vim.fn.getcmdline())
	end, { desc = "Redirect Cmdline" })
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = config,
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
}
