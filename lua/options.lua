return function(config)
    local opt = vim.opt

    -- Set leaders
    vim.g.mapleader = config.leader or [[ ]]
    vim.g.maplocalleader = config.localleader or [[,]]

    -- Delimiters
    vim.g.csv_delim=','
    vim.g.csv_default_delim=','


    -- status
    opt.laststatus = 3
    opt.showtabline = 0
    opt.showmode = false

    -- indentation
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.copyindent = true
    opt.shiftround = true
    opt.smartindent = true

    -- search
    opt.showmatch = true
    opt.smartcase = true
    opt.ignorecase = true
    opt.wildmode = "longest,full"

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
    opt.undofile = true
    opt.termguicolors = true
    opt.clipboard = "unnamedplus"
    opt.completeopt = {"menuone", "noselect", "noinsert"}
    opt.formatoptions:append "cro"

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
    opt.shortmess:append "sI"
    -- go to previous/next line with h,l,left arrow and right arrow
    -- when cursor reaches end/beginning of line
    opt.whichwrap:append "<>[]hl"
end
