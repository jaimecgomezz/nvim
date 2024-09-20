return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>H", function()
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

		vim.keymap.set("n", "<leader>hc", function()
			harpoon:list():clear()
		end, { desc = "Open harpoon window" })

		for n = 1, 9 do
			vim.keymap.set("n", "<leader>" .. n, function()
				harpoon:list():select(n)
			end)
		end
	end,
}
