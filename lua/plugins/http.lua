return {
	"mistweaverco/kulala.nvim",
	ft = "http",
	opts = {},
	init = function()
		vim.filetype.add({ extension = { ["http"] = "http" } })
	end,
    -- stylua: ignore
    keys = {
        { "<leader>c", "", desc = "+Rest" },
        { "<leader>cs", function() require('kulala').run() end, desc = "Send the request" },
        { "<leader>ct", function() require('kulala').toggle_view() end, desc = "Toggle headers/body" },
        { "<leader>cp", function() require('kulala').jump_prev() end, desc = "Jump to previous request" },
        { "<leader>cn", function() require('kulala').jump_next() end, desc = "Jump to next request" },
    },
}
