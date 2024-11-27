-- TODO: when buffers remaining, show a prompt to be able to delete them

return {
  "mhinz/vim-startify",
  lazy = false,
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
	-- stylua: ignore
	keys = {
        { "<leader>vs", "<CMD> Startify <CR>", desc = "Startify" },
        { "<leader>bq", "<CMD>silent! %bd <BAR> Startify <CR>", desc = "Startify" },
    }
,
}
