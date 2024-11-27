local vim = vim
local opt = vim.opt

-- leaders
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- general
opt.showmatch = true
opt.matchtime = 3
opt.hidden = true
opt.spell = false
opt.spelllang = "en_us"

-- status
opt.laststatus = 2
opt.showtabline = 0
opt.showmode = false

-- indentation
opt.expandtab = true
opt.smartindent = true
opt.tabstop = 2
opt.shiftwidth = 2

-- search
opt.smartcase = true
opt.ignorecase = true
opt.wildmode = "list:longest,list:full"

-- margin
opt.ruler = false
opt.number = true
opt.relativenumber = false
opt.numberwidth = 2
opt.scrolloff = 9999
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
opt.autoread = true
opt.swapfile = false
opt.undofile = true
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
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  virtual_text = false,
  signs = true,
  float = {
    scope = "cursor",
    source = true,
    focusable = false,
    border = "single",
  },
})

-- Neovide
vim.g.neovide_cursor_vfx_mode = ""
vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_antialiasing = false
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false

-- Latex
vim.cmd([[
  filetype plugin indent on
  syntax on
]])
