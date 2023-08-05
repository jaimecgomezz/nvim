return function(_)
    local function map(mode, lhs, rhs, other_opts)
        local opts = vim.tbl_deep_extend("force",
                                         {silent = true, noremap = true},
                                         other_opts or {})

        vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Navigation
    -- Line navigation
    map("i", "<C-b>", "<ESC>^i", {desc = "Beginning of line"})
    map("i", "<C-e>", "<End>", {desc = "End of line"})
    -- Insert navigation
    map("i", "<A-h>", "<Left>", {desc = "Move left"})
    map("i", "<A-l>", "<Right>", {desc = "Move right"})
    map("i", "<A-j>", "<Down>", {desc = "Move down"})
    map("i", "<A-k>", "<Up>", {desc = "Move up"})
    -- Wrapped lines navigation
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
        {desc = "Move down", expr = true})
    map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
        {desc = "Move up", expr = true})
    map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
        {desc = "Move up", expr = true})

    map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
        {desc = "Move down", expr = true})
    map("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
        {desc = "Move up", expr = true})
    map("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
        {desc = "Move down", expr = true})
    map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
        {desc = "Move down", expr = true})
    map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
        {desc = "Move up", expr = true})
    -- Line movement
    map("n", "<C-S-j>", "<cmd>m .+1<cr>==", {desc = "Move line down"})
    map("n", "<C-S-k>", "<cmd>m .-2<cr>==", {desc = "Move line up"})
    map("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", {desc = "Move line down"})
    map("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", {desc = "Move line up"})
    map("v", "<C-S-j>", ":m '>+1<cr>gv=gv", {desc = "Move line down"})
    map("v", "<C-S-k>", ":m '<-2<cr>gv=gv", {desc = "Move line up"})
    map("n", "<C-S-Down>", "<cmd>m .+1<cr>==", {desc = "Move line down"})
    map("n", "<C-S-Up>", "<cmd>m .-2<cr>==", {desc = "Move line up"})
    map("i", "<C-S-Down>", "<esc><cmd>m .+1<cr>==gi", {desc = "Move line down"})
    map("i", "<C-S-Up>", "<esc><cmd>m .-2<cr>==gi", {desc = "Move line up"})
    map("v", "<C-S-Down>", ":m '>+1<cr>gv=gv", {desc = "Move line down"})
    map("v", "<C-S-Up>", ":m '<-2<cr>gv=gv", {desc = "Move line up"})
    -- Hunks navigation
    map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() require("gitsigns").next_hunk() end)
        return "<Ignore>"
    end, {desc = " Jump to next hunk", expr = true})
    map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() require("gitsigns").prev_hunk() end)
        return "<Ignore>"
    end, {desc = "Jump to prev hunk", expr = true})
    -- Diagnostics navigation
    map("n", "[d", function()
        vim.diagnostic.goto_prev({float = {border = "rounded"}})
    end, {desc = "Previous diagnostic"})
    map("n", "]d", function()
        vim.diagnostic.goto_next({float = {border = "rounded"}})
    end, {desc = "Next diagnostic"})

    -- Miscellaneus
    -- Hide highlights
    map("n", "<Esc>", ":noh <CR>", {desc = "Clear highlights"})
    -- Copy whole file content
    map("n", "<C-c>", "<cmd> %y+ <CR>", {desc = "Copy whole file"})
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>',
        {desc = "Dont copy replaced text"})

    -- Line numbers
    map("n", "<leader>n", "<cmd> set nu! <CR>", {desc = "Toggle line number"})
    map("n", "<leader>nr", "<cmd> set rnu! <CR>",
        {desc = "Toggle relative number"})

    -- Buffers
    map("n", "<leader>bn", "<cmd> enew <CR>", {desc = "New buffer"})
    map("n", "<leader>bs", "<cmd>silent w<cr>", {desc = "Sabe buffer"})
    map("n", "<leader>bd", "<cmd>bdelete<cr>", {desc = "Delete buffer"})
    map("n", "<leader>bD", "<cmd>bdelete!<cr>", {desc = "Delete buffer!"})
    map("n", "<leader>bq", function()
        local ok, _ = pcall(vim.cmd, [[bufdo bd]])

        if ok then vim.cmd([[Startify]]) end
    end, {desc = "Quit buffer"})
    map("n", "<leader>bw", "<cmd>echo expand('%:p')<cr>",
        {desc = "Where buffer?"})

    -- Windows
    -- Split windows
    map("n", "<C-s>", "<c-w><c-v>", {desc = "Split vertical"})
    map("n", "<C-t>", "<c-w><c-s>", {desc = "Split horizontal"})
    -- Switch between windows
    map("n", "<C-Left>", "<C-w>h", {desc = "Window left"})
    map("n", "<C-Right>", "<C-w>l", {desc = "Window right"})
    map("n", "<C-Down>", "<C-w>j", {desc = "Window down"})
    map("n", "<C-Up>", "<C-w>k", {desc = "Window up"})
    -- Switch between windows from terminal
    map("t", "<A-h>", [[<C-\><C-n><C-W>h]], {desc = "Move left window"})
    map("t", "<A-j>", [[<C-\><C-n><C-W>j]], {desc = "Move bottom window"})
    map("t", "<A-k>", [[<C-\><C-n><C-W>k]], {desc = "Move upper window"})
    map("t", "<A-l>", [[<C-\><C-n><C-W>l]], {desc = "Move right window"})

    -- LSP
    map("n", "K", function() vim.lsp.buf.hover() end, {desc = "LSP hover"})
    map("i", "<C-s>", function() vim.lsp.buf.signature_help() end,
        {desc = "LSP signature help"})
    map("n", "gr", function() vim.lsp.buf.references() end,
        {desc = "LSP references"})

    -- Filer
    map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", {desc = "Open filer"})
    map("n", "<localleader>ff", "<cmd>NvimTreeToggle<cr>", {desc = "Open filer"})
    map("n", "<localleader>fb", "<cmd>NvimTreeFindFileToggle<cr>",
        {desc = "Find buffer in filer"})

    -- Projects
    map("n", "<leader>pw", "<cmd>pwd<cr>", {desc = "Whre project?"})
    map("n", "<leader>fp", "<cmd>FzfSwitchProject<cr>", {desc = "Find projects"})

    -- Vim
    map("n", "<leader>vq", "<cmd>qa<cr>", {desc = "Quit vim"})
    map("n", "<leader>vQ", "<cmd>qa!<cr>", {desc = " Quit vim!"})
    map("n", "<leader>vs", "<cmd>Startify<cr>", {desc = "Start page"})
    map("n", "<localleader>ve",
        "<cmd>cd ~/.config/nvim<cr><cmd>:e ~/.config/nvim/init.lua<cr>",
        {desc = "Edit vim conf"})

    -- Git
    -- Fugitive
    map("n", "<leader>gg", "<cmd>vert Git<cr>", {desc = "Git status"})
    map("n", "<leader>gl", "<cmd>vert Git log<cr>", {desc = "Git log"})
    -- Signs
    map("n", "<leader>rh", function() require("gitsigns").reset_hunk() end,
        {desc = "Reset hunk"})
    map("n", "<leader>ph", function() require("gitsigns").preview_hunk() end,
        {desc = "Preview hunk"})
    map("n", "<leader>gb", function() package.loaded.gitsigns.blame_line() end,
        {desc = "Blame line"})
    map("n", "<leader>td", function() require("gitsigns").toggle_deleted() end,
        {desc = "Toggle deleted"})

    -- Terminal
    map("t", "<C-x>",
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
        {desc = "Escape terminal mode"})

    -- Tagbar
    map("n", "<localleader>t", "<cmd>TagbarToggle<cr>", {desc = "Open tagbar"})
    map("n", "<localleader>u", "<cmd>UndotreeToggle<cr>",
        {desc = "Open undotree"})

    -- Telescope
    map("n", "<C-p>", "<cmd> Telescope find_files <CR>", {desc = "Find files"})
    map("n", "<C-l>",
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ cwd = vim.fn.expand('%:p:h'), previewer = false })) <CR>",
        {desc = "Find relative files"})
    map("n", "<C-space>",
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ sort_mru = true, ignore_current_buffer = true, previewer = false })) <CR>",
        {desc = "Find buffers"})
    map("n", "<leader>ff", "<cmd> Telescope live_grep <CR>",
        {desc = "Live grep"})
    map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>",
        {desc = "Find oldfiles"})
    map("n", "<leader>ft", "<cmd> Telescope filetypes <CR>",
        {desc = "Find filetypes"})
    map("n", "<leader>fq", "<cmd> Telescope quickfix <CR>",
        {desc = "Find quickfix"})
    map("n", "<leader>fr", "<cmd> Telescope registers <CR>",
        {desc = "Find registers"})
    map("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>",
        {desc = "Find diagnostics"})
    map("n", "<leader>fw", "<cmd> Telescope grep_string <CR>",
        {desc = "Find word under cursor"})
    map("n", "<leader>fc", "<cmd> Telescope colorscheme <CR>",
        {desc = "Find colorschemes"})
    map("n", "<leader>fb", "<cmd> Telescope current_buffer_fuzzy_find <CR>",
        {desc = "Find in current buffer"})
    map("n", "<C-A-p>",
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        {desc = "Find all files"})
    map("n", "<leader>fgc", "<cmd> Telescope git_commits <CR>",
        {desc = "Find git commits"})
    map("n", "<leader>fgb", "<cmd> Telescope git_branches <CR>",
        {desc = "Find git branches"})
    map("n", "<leader>fgs", "<cmd> Telescope git_status <CR>",
        {desc = "Find git status"})

    -- DAP
    map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>",
        {desc = "Toggle breakpoint"})
    map("n", "<leader>dq", function()
        require("dapui").close()
        require("dap").close()
    end, {desc = "Quit DAP"})
    map("n", "<leader>dr", function() require("dap").continue() end,
        {desc = "Start DAP"})
    map("n", "<leader>dc", function() require("dap").continue() end,
        {desc = "DAP continue"})
    map("n", "<leader>dn", function() require("dap").step_over() end,
        {desc = "DAP next"})
end
