return {
  {
    "ludovicchabant/vim-gutentags",
    init = function()
      vim.g.gutentags_ctags_executable_ruby = "ripper-tags"
    end,
  },
  {
    "preservim/tagbar",
    init = function()
      vim.g.tagbar_autoclose = 1
      vim.g.tagbar_width = 80
      vim.g.tagbar_autofocus = 1
      vim.g.tagbar_compact = 2
      vim.g.tagbar_show_data_type = 1
      vim.g.tagbar_autoshowtag = 1
      vim.g.tagbar_ignore_anonymous = 1
      vim.g.tagbar_show_visibility = 1
      vim.g.tagbar_previewwin_pos = ""
      vim.g.tagbar_autopreview = 0
      vim.g.tagbar_sort = 0
    end,
    keys = {
      { "<localleader>t", "<cmd>TagbarToggle<cr>", desc = "Open tagbar" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      extensions = {
        "quickfix",
        "fugitive",
        "man",
        "nvim-tree",
        "oil",
        "overseer",
        "toggleterm",
      },
      options = {
        ignore_focus = {
          "dapui_watches",
          "dapui_breakpoints",
          "dapui_scopes",
          "dapui_console",
          "dapui_stacks",
          "dap-repl",
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = { user_default_options = { mode = "virtualtext" } },
  },
  {
    "chrisbra/csv.vim",
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    init = function()
      vim.g.csv_delim = ","
      vim.g.csv_default_delim = ","
      vim.g.csv_start = 1
      vim.g.csv_end = 2
      vim.g.csv_arrange_align = "l*"
    end,
  },
  {
    "airblade/vim-rooter",
    init = function()
      vim.g.rooter_buftypes = { "" }
      vim.g.rooter_patterns = { ".git", "!^tmp" }
      vim.g.rooter_change_directory_for_non_project_files = "current"
    end,
  },
  {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    config = true,
    submodules = false,
    keys = {
      { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } },
    },
  },
  {
    "lambdalisue/vim-suda",
    init = function()
      vim.g.suda_smart_edit = 1
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = { { "Bilal2453/luvit-meta", lazy = true } },
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "tversteeg/registers.nvim",
    lazy = false,
    cmd = "Registers",
    name = "registers",
    opts = {
      show_empty = false,
      window = {
        max_width = 80,
        border = "single",
        transparency = 0,
      },
    },
    keys = {
      { '"', mode = { "n", "v" } },
      { "<C-R>", mode = "i" },
    },
  },
  {
    "mhinz/vim-grepper",
    keys = {
      { "<leader>ff", "<cmd> Grepper <CR>", desc = "Find word under cursor", mode = { "n" } },
      { "<leader>fw", "<cmd> Grepper -cword -noprompt <CR>", desc = "Find word under cursor", mode = { "n" } },
      { "<leader>fw", "<cmd> Grepper -highlight -noprompt <CR>", desc = "Find word highlighted", mode = { "v" } },
    },
  },
}
