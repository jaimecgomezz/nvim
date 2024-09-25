local config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")
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
			path_display = { "truncate" },
			file_ignore_patterns = { "node_modules" },
			winblend = 0,
			layout_strategy = "vertical",
			layout_config = {
				vertical = {
					width = function(_, max_columns)
						local min = 80
						local percentage = 0.4

						return math.max(math.floor(percentage * max_columns), min)
					end,
				},
			},
			mappings = {
				n = {
					-- Exit
					["q"] = actions.close,
					["<Esc>"] = actions.close,

					-- Selection
					["<C-Space>"] = actions.toggle_selection,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

					-- Path
					["-"] = path_actions.insert_reltobufpath_visual,
					["="] = path_actions.insert_abspath_visual,
				},
				i = {
					-- Exit
					["<Esc>"] = actions.close,
					["<C-n>"] = { "<esc>", type = "command" },

					-- Selection
					["<C-Space>"] = actions.toggle_selection,
					["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

					-- Movement
					["<Tab>"] = actions.move_selection_next,
					["<S-Tab>"] = actions.move_selection_previous,
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
        { "<leader>fr", "<cmd> Telescope registers <CR>", desc = "Find registers" },
        { "<leader>fd", "<cmd> Telescope diagnostics bufnr=0 <CR>", desc = "Find diagnostics" },
        { "<leader>fw", "<cmd> Telescope grep_string <CR>", desc = "Find word under cursor" },
        { "<leader>fc", "<cmd> Telescope colorscheme <CR>", desc = "Find colorschemes" },
        { "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Find help tags" },
        { "z=", "<cmd> Telescope spell_suggest <CR>", desc = "Suggest spell corrections" },
        { "<localleader>s", "<cmd> Telescope spell_suggest <CR>", desc = "Suggest spell corrections" },
        { "<C-A-p>", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Find all files" },
        { "<C-l>", "<cmd>lua require( 'telescope.builtin').find_files( { cwd = vim.fn.expand( '%:p:h') }) <CR>", desc = "Find relative files" },
        { "<C-space>", "<cmd>lua require( 'telescope.builtin').buffers( { sort_mru = true, ignore_current_buffer = true }) <CR>", desc = "Find buffers" }
    },
}
