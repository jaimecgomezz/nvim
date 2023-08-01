return {
    "mhinz/vim-startify",
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
    end
}
