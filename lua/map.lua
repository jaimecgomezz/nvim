-- Diagnostics navigation
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { border = "rounded" } })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ float = { border = "rounded" } })
end, { desc = "Next diagnostic" })

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
-- Switch between windows
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Window up" })

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
