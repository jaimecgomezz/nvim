-- basic telescope configuration
local tvalues = require("telescope.config").values
local toggle_telescope = function(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

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
end

local config = function()
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

	vim.keymap.set("n", "<leader>h", function()
		toggle_telescope(harpoon:list())
	end, { desc = "Open harpoon window" })

	vim.keymap.set("n", "<leader>hc", function()
		harpoon:list():clear()
	end, { desc = "Open harpoon window" })

	for n = 1, 9 do
		vim.keymap.set("n", "<leader>" .. n, function()
			harpoon:list():select(n)
		end)
	end
end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
