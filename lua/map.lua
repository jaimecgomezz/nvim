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

-- Jump to tag in split window
vim.keymap.set("n", "gs", function()
	local word = vim.fn.expand("<cword>")
	vim.cmd("vertical split")
	vim.cmd("tag " .. word)
end, { desc = "Jump to definition (vsplit)" })

vim.keymap.set("n", "gS", function()
	local word = vim.fn.expand("<cword>")
	vim.cmd("split")
	vim.cmd("tag " .. word)
end, { desc = "Jump to definition (vsplit)" })

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

-- Move in/out terminal
vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-W>h]], { desc = "Move left window" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-W>j]], { desc = "Move bottom window" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-W>k]], { desc = "Move upper window" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-W>l]], { desc = "Move right window" })

-- Move between wrapped lines
vim.keymap.set("n", "<localleader>w", function()
	local wrap = not vim.o.wrap

	vim.o.wrap = wrap
	vim.o.textwidth = wrap and 0 or 120
end, { desc = "Toggle wrap" })
vim.keymap.set("n", "j", "gj", { desc = "Move to line below" })
vim.keymap.set("n", "k", "gk", { desc = "Move to line below" })
