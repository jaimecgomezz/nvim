local config = function()
	local telescope = require("telescope")
	local path_actions = require("telescope_insert_path")

	telescope.setup({
		defaults = {
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			prompt_prefix = "❯ ",
			selection_caret = "❯ ",
			entry_orefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "vertical",
			path_display = { "truncate" },
			file_ignore_patterns = { "node_modules" },
			winblend = 0,
			border = {},
			borderchars = { "-", "|", "-", "|", "╭", "╮", "╯", "╰" },
			mappings = {
				n = {
					["q"] = require("telescope.actions").close,
					["<Esc>"] = require("telescope.actions").close,
					["<C-q>"] = require("telescope.actions").send_selected_to_qflist,
					["<C-Space>"] = require("telescope.actions").toggle_selection,
					["-"] = path_actions.insert_reltobufpath_visual,
					["="] = path_actions.insert_abspath_visual,
				},
				i = {
					["<Esc>"] = require("telescope.actions").close,
					["<C-n>"] = { "<esc>", type = "command" },
					["<Tab>"] = require("telescope.actions").move_selection_next,
					["<S-Tab>"] = require("telescope.actions").move_selection_previous,
					["<C-Space>"] = require("telescope.actions").toggle_selection,
					["<C-q>"] = require("telescope.actions").send_selected_to_qflist,
				},
			},
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("ui-select")
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.7",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kiyoon/telescope-insert-path.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	-- stylua: ignore
	keys = {
        { "<C-p>", [[<CMD> Telescope find_files <CR>]], desc = "Find files" },
        { "<leader>ff", "<cmd> Telescope live_grep <CR>", desc = "Live grep" },
        { "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "Find oldfiles" },
        { "<leader>ft", "<cmd> Telescope filetypes <CR>", desc = "Find filetypes" },
        { "<leader>fq", "<cmd> Telescope quickfix <CR>", desc = "Find quickfix" },
        { "<leader>fr", "<cmd> Telescope registers <CR>", desc = "Find registers" },
        { "<leader>fd", "<cmd> Telescope diagnostics bufnr=0 <CR>", desc = "Find diagnostics" },
        { "<leader>fw", "<cmd> Telescope grep_string <CR>", desc = "Find word under cursor" },
        { "<leader>fc", "<cmd> Telescope colorscheme <CR>", desc = "Find colorschemes" },
        { "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Find help tags" },
        { "<leader>fbc", "<cmd> Telescope git_bcommits <CR>", desc = "Find buffer commits" },
        { "<leader>fgc", "<cmd> Telescope git_commits <CR>", desc = "Find git commits" },
        { "<C-A-p>", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Find all files" },
        { "<C-l>", "<cmd>lua require( 'telescope.builtin').find_files( { cwd = vim.fn.expand( '%:p:h') }) <CR>", desc = "Find relative files" },
        { "<C-space>", "<cmd>lua require( 'telescope.builtin').buffers( { sort_mru = true, ignore_current_buffer = true }) <CR>", desc = "Find buffers" }
    }
,
}
