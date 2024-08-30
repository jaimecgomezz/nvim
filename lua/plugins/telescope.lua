local config = function()
  local telescope = require('telescope')
  local path_actions = require('telescope_insert_path')

  telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case"
        },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "-", "|", "-", "|", "╭", "╮", "╯", "╰" },
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
            ["<Esc>"] = require("telescope.actions").close,
            ["<C-q>"] = require("telescope.actions").send_selected_to_qflist,
            ["<C-Space>"] = require("telescope.actions").toggle_selection,
            ["-"] = path_actions.insert_reltobufpath_visual,
            ["="] = path_actions.insert_abspath_visual,
          },
          i = {
            ["<Tab>"] = require("telescope.actions").move_selection_next,
            ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
            ["<C-Space>"] = require("telescope.actions").toggle_selection,
            ["<C-q>"] = require("telescope.actions").send_selected_to_qflist,
          }
        },
        extensions = {
          undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              preview_height = 0.8,
            },
          }
        },
      }
  })

  telescope.load_extension('fzf')
  telescope.load_extension('undo')

  vim.keymap.set('n', '<C-p>', [[<CMD> Telescope find_files <CR>]], { desc = "Find files" })
  vim.keymap.set("n", "<C-A-p>", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", {desc = "Find all files"})
  vim.keymap.set("n", "<C-l>", "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) <CR>", {desc = "Find relative files"})
  vim.keymap.set("n", "<C-space>", "<cmd>lua require('telescope.builtin').buffers({ sort_mru = true, ignore_current_buffer = true }) <CR>", {desc = "Find buffers"})
  vim.keymap.set("n", "<leader>ff", "<cmd> Telescope live_grep <CR>", {desc = "Live grep"})
  vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", {desc = "Find oldfiles"})
  vim.keymap.set("n", "<leader>ft", "<cmd> Telescope filetypes <CR>", {desc = "Find filetypes"})
  vim.keymap.set("n", "<leader>fq", "<cmd> Telescope quickfix <CR>", {desc = "Find quickfix"})
  vim.keymap.set("n", "<leader>fr", "<cmd> Telescope registers <CR>", {desc = "Find registers"})
  vim.keymap.set("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", {desc = "Find diagnostics"})
  vim.keymap.set("n", "<leader>fw", "<cmd> Telescope grep_string <CR>", {desc = "Find word under cursor"})
  vim.keymap.set("n", "<leader>fc", "<cmd> Telescope colorscheme <CR>", {desc = "Find colorschemes"})
  vim.keymap.set("n", "<leader>fu", "<cmd> Telescope undo <CR>", {desc = "Find colorschemes"})
  vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", {desc = "Find help tags"})
  vim.keymap.set("n", "<leader>fbc", "<cmd> Telescope git_bcommits <CR>", {desc = "Find buffer commits"})
  vim.keymap.set("n", "<leader>fgc", "<cmd> Telescope git_commits <CR>", {desc = "Find git commits"})
end

return({
  'nvim-telescope/telescope.nvim',
  tag = '0.1.7',
  config = config,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    'kiyoon/telescope-insert-path.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make'  }
  },
})
