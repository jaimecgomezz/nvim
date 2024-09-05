local config = function()
	vim.keymap.set("n", "<leader>vs", [[<CMD> Startify <CR>]], { desc = "Startify" })
	vim.keymap.set("n", "<leader>bq", [[<CMD>silent! %bd <BAR> Startify <CR>]], { desc = "Startify" })
end

return {
	"mhinz/vim-startify",
	config = config,
	init = function()
		vim.cmd([[
          let g:ascii = [
                \ " ██▒   █▓ ██▓ ███▄ ▄███▓ ",
                \ "▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ",
                \ " ▓██  █▒░▒██▒▓██    ▓██░ ",
                \ "  ▒██ █░░░██░▒██    ▒██  ",
                \ "   ▒▀█░  ░██░▒██▒   ░██▒ ",
                \ "   ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
                \ "   ░ ░░   ▒ ░░  ░      ░ ",
                \ "     ░░   ▒ ░░      ░    ",
                \ "      ░   ░         ░    ",
                \ "     ░                   ",
                \ ]
          let g:startify_custom_header ='startify#pad(g:ascii + startify#fortune#boxed())'
          let g:startify_lists = [{ 'type': 'files',     'header': ['   Recent']  }]
        ]])
	end,
}
