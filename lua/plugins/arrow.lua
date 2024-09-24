return {
	"otavioschwanck/arrow.nvim",
	lazy = false,
	opts = {
		hide_handbook = true,
		mappings = {
			edit = "e",
			delete_mode = "d",
			clear_all_items = "X",
			toggle = "a",
			open_vertical = "v",
			open_horizontal = "s",
			quit = "q",
			remove = "x",
			next_item = "]",
			prev_item = "[",
		},
		window = {
			border = "single",
		},
		per_buffer_config = {
			lines = 5,
		},
		leader_key = ";",
		buffer_leader_key = "m",
	},
	-- stylua: ignore
	keys = {
		{ "H", function() require("arrow.persist").previous() end, desc = "Previous arrowed file" },
		{ "L", function() require("arrow.persist").next() end, desc = "Next arrowed file" },
        { "<leader>h", function() require("arrow.persist").toggle() end, desc = "Arrow file" },
        { "<leader>H", function() require("arrow.commands").commands.toggle_current_line_for_buffer() end, desc = "Arrow line" },
	},
}
