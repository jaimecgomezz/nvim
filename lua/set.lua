local vim = vim
local opt = vim.opt

-- leaders
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- general
opt.showmatch = true

-- status
opt.laststatus = 2
opt.showtabline = 0
opt.showmode = false

-- indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.copyindent = true
opt.shiftround = true
opt.smartindent = true
opt.autoindent = true

-- search
opt.smartcase = true
opt.ignorecase = true
opt.wildmode = "list:longest,list:full"

-- margin
opt.ruler = false
opt.number = true
opt.numberwidth = 2
opt.scrolloff = 999
opt.cursorline = true
opt.signcolumn = "yes"

-- splits
opt.splitbelow = true
opt.splitright = true

-- times
opt.timeoutlen = 400
opt.updatetime = 250

-- text
opt.wrap = false
opt.textwidth = 80

-- miscellaneus
opt.updatetime = 100
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.formatoptions:append("cro")

-- folding
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

-- fixes
-- disable mouse
opt.mouse = ""
-- disable bell noise
opt.errorbells = false
-- disable nvim intro
opt.shortmess:append("sI")
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Diagnostics config
vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		scope = "cursor",
		source = true,
		focusable = false,
		border = "single",
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
		},
	},
})

-- Neovide
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_antialiasing = false
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
