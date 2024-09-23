return {
	"rest-nvim/rest.nvim",
	ft = "http",
	config = function()
		vim.filetype.add({ extension = { ["http"] = "http" } })
	end,
    -- stylua: ignore
    keys = {
        { "<leader>s", "", desc = "+Rest" },
        { "<leader>ss", "<CMD> Rest run <CR>", desc = "Run request under cursor" },
        { "<leader>sS", function ()
                vim.ui.input({ prompt = "Request name " }, function(name)
                    if name ~= nil and name ~= "" then
                        cmd = "Rest run " .. name
                        vim.cmd(cmd)
                    end
                end)
        end, desc = "Run names request" },
        { "<leader>sp", "<CMD> Rest last <CR>", desc = "Run previous request" },
        { "<leader>sl", "<CMD> Rest logs <CR>", desc = "Open rest logs" },
        { "<leader>sc", "<CMD> Rest cookies <CR>", desc = "Open rest cookies" },
        { "<leader>se", "<CMD> Rest env <CR>", desc = "Open rest env" },
        { "<leader>sE", "<CMD> Rest env select <CR>", desc = "Set rest env" },
    },
}
