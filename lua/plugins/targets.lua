return {
  {
    "otavioschwanck/arrow.nvim",
    lazy = false,
    opts = {
      leader_key = "'",
      global_bookmarks = false,
      separate_by_branch = true,
      hide_handbook = true,
      mappings = {
        edit = "e",
        delete_mode = "d",
        clear_all_items = "X",
        toggle = "t",
        open_vertical = "v",
        open_horizontal = "s",
        quit = "q",
        remove = "x",
        next_item = "]",
        prev_item = "[",
      },
      window = {
        border = "single",
      },
      per_buffer_config = {
        lines = 10,
      },
    },
    keys = {
      {
        "<leader>hh",
        function()
          require("arrow.persist").toggle()
        end,
        desc = "Arrow file",
      },
    },
  },
  {
    "MattesGroeger/vim-bookmarks",
    init = function()
      vim.g.bookmark_no_default_key_mappings = 1
      vim.g.bookmark_save_per_working_dir = 1
      vim.g.bookmark_auto_save = 1
    end,
    keys = {
      { "mm", "<CMD> BookmarkToggle <CR>", desc = "Toggle bookmark" },
      {
        "mM",
        function()
          vim.ui.input({ prompt = "Comment: " }, function(comment)
            if comment ~= nil and comment ~= "" then
              cmd = "BookmarkAnnotate " .. comment
              vim.cmd(cmd)
            end
          end)
        end,
        desc = "Toggle commentary bookmark",
      },
      { "mn", "<CMD> BookmarkNext <CR>", desc = "Next bookmark" },
      { "mp", "<CMD> BookmarkPrev <CR>", desc = "Previous bookmark" },
      { "ml", "<CMD> BookmarkShowAll <CR>", desc = "Show all bookmark" },
      { "mx", "<CMD> BookmarkClearAll <CR>", desc = "Clear all bookmark" },
    },
  },
  {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    opts = {},
    keys = {
      {
        "<C-w>p",
        function()
          require("nvim-window").pick()
        end,
        desc = "Pick window",
      },
    },
  },
}
