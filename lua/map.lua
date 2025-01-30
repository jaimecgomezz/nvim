-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_vim.keymap.setping_for_paste
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Dont copy replaced text" })

-- Buffers
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>bs", "<cmd>silent w<cr>", { desc = "Sabe buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Delete buffer!" })
vim.keymap.set("n", "<leader>bw", "<cmd>echo expand('%:p')<cr>", { desc = "Where buffer?" })

-- Windows
-- Split windows
vim.keymap.set("n", "<C-s>", "<c-w><c-v>", { desc = "Split vertical" })
vim.keymap.set("n", "<C-t>", "<c-w><c-s>", { desc = "Split horizontal" })

-- Projects
vim.keymap.set("n", "<leader>pw", "<cmd>pwd<cr>", { desc = "Whre project?" })

-- Vim
vim.keymap.set("n", "<leader>vq", "<cmd>qa<cr>", { desc = "Quit vim" })
vim.keymap.set("n", "<leader>vQ", "<cmd>qa!<cr>", { desc = " Quit vim!" })
vim.keymap.set(
  "n",
  "<leader>ve",
  "<cmd>cd ~/.config/nvim<cr><cmd>:e ~/.config/nvim/init.lua<cr>",
  { desc = "Edit vim conf" }
)

-- Toggle spell
vim.keymap.set("n", "<localleader>s", function()
  vim.o.spell = not vim.o.spell
end, { desc = "Toggle spell" })

-- Move between wrapped lines
vim.keymap.set("n", "<localleader>w", function()
  local wrap = not vim.o.wrap

  vim.o.wrap = wrap
  vim.o.textwidth = wrap and 0 or 80
end, { desc = "Toggle wrap" })
vim.keymap.set("n", "j", "gj", { desc = "Move to line below" })
vim.keymap.set("n", "k", "gk", { desc = "Move to line below" })

-- Toggle numbers
vim.keymap.set("n", "<localleader>n", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle line number" })

-- Set scrolloff
vim.keymap.set("n", "<localleader>o", function()
  vim.o.scrolloff = 9999
end, { desc = "Enforce scrolloff" })

-- Quickfix
vim.keymap.set("n", "]q", "<CMD> cnext <CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "[q", "<CMD> cprev <CR>", { desc = "Previous quickfix item" })

-- Loclist
vim.keymap.set("n", "]l", "<CMD> lnext <CR>", { desc = "Next loclist item" })
vim.keymap.set("n", "[l", "<CMD> lprev <CR>", { desc = "Previous loclist item" })
