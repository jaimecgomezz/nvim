return {
  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      default_amount = 5,
      at_edge = "stop",
      resize_mode = {
        quit_key = "w",
        silent = false,
      },
    },
    keys = {
      -- moving between splits
      {
        "<A-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to window left",
      },
      {
        "<A-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to window down",
      },
      {
        "<A-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to window up",
      },
      {
        "<A-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move window right",
      },

      -- Resize windows
      {
        "<C-A-h>",
        function()
          require("smart-splits").resize_left()
        end,
        desc = "Resize window to left",
      },
      {
        "<C-A-j>",
        function()
          require("smart-splits").resize_down()
        end,
        desc = "Resize widnow to bottom",
      },
      {
        "<C-A-k>",
        function()
          require("smart-splits").resize_up()
        end,
        desc = "Resize window to top",
      },
      {
        "<C-A-l>",
        function()
          require("smart-splits").resize_right()
        end,
        desc = "Resize window to right",
      },

      {
        "<C-w>r",
        function()
          require("smart-splits").start_resize_mode()
        end,
        desc = "Start resize mode",
      },
    },
  },
  {
    "sindrets/winshift.nvim",
    opts = {
      keymaps = {
        disable_defaults = true,
        win_move_mode = {
          ["h"] = "left",
          ["j"] = "down",
          ["k"] = "up",
          ["l"] = "right",
          ["H"] = "far_left",
          ["J"] = "far_down",
          ["K"] = "far_up",
          ["L"] = "far_right",
        },
      },
    },
    keys = {
      { "<C-w>s", "<Cmd>WinShift<CR>", desc = "Shift window" },
    },
  },
}
