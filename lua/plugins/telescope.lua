local config = function()
  local telescope = require('telescope')


  telescope.setup({
      defaults = {
        vimgrep_arguments = {
            "rg", "-L", "--color=never", "--no-heading",
            "--with-filename", "--line-number", "--column",
            "--smart-case"
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8
            },
            vertical = {mirror = false},
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
        },
        path_display = {"truncate"},
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        mappings = {
            n = {["q"] = require("telescope.actions").close},
            i = {
                ['<Tab>'] = require("telescope.actions").move_selection_next,
                ['<S-Tab>'] = require("telescope.actions").move_selection_previous,
                ['<C-Space>'] = require("telescope.actions").toggle_selection,
                ['<Esc>'] = require("telescope.actions").close,
                ['<C-q>'] = require("telescope.actions").send_selected_to_qflist
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
end

return({
  'nvim-telescope/telescope.nvim',
  tag = '0.1.7',
  config = config,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make'  }
  },
})
