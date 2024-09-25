return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			harpoon:setup()

			vim.keymap.set("n", "<C-a>", function()
				local item = harpoon:list():get_by_value(vim.fn.expand("%"))

				if not item then
					harpoon:list():add()
				else
					harpoon:list():remove()
				end
			end)

			vim.keymap.set("n", "<leader>hh", function()
				local file_paths = {}
				for _, item in ipairs(harpoon:list().items) do
					table.insert(file_paths, item.value)
				end

				local tvalues = require("telescope.config").values
				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = tvalues.file_previewer({}),
						sorter = tvalues.generic_sorter({}),
					})
					:find()
			end, { desc = "Open harpoon window" })

			vim.keymap.set("n", "<leader>hx", function()
				harpoon:list():clear()
			end, { desc = "Open harpoon window" })

			for n = 1, 9 do
				vim.keymap.set("n", "'" .. n, function()
					harpoon:list():select(n)
				end)
			end
		end,
	},

	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {
			autojump = true,
		},
		label = {
			after = false,
			before = true,
		},
		modes = {
			char = {
				autohide = true,
				jump_labels = true,
			},
			treesitter_search = {
				search = { incremental = true },
				label = {
					before = true,
					after = false,
					style = "overlay",
				},
			},
		},
		prompt = { enabled = false },
	},
	-- stylua: ignore
	keys = {
		{ "s", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x" } },
		{ "r", function() require("flash").remote() end, desc = "Remote Flash", mode = "o" },
        { "?", function() require("flash").treesitter_search() end, desc = "Treesitter Search", mode = { "n", "o", "x" } },
        { "<C-s>", function() require("flash").toggle() end, desc = "Toggle Flash Search", mode = { "c" } },
	},
}
