return {
  {
    "backdround/global-note.nvim",
    opts = {
      filename = "note.md",
      title = "Notes",
      command_name = "Note",
      window_config = function()
        local min_width = 80
        local width_percentage = 0.4
        local max_width = vim.o.columns
        local width = math.max(math.floor(max_width * width_percentage), min_width)

        local min_height = 40
        local height_percentage = 0.6
        local max_height = vim.api.nvim_win_get_height(0)
        local height = math.max(math.floor(max_height * height_percentage), min_height)

        return {
          relative = "editor",
          border = "single",
          title = "Note",
          title_pos = "center",
          width = width,
          height = height,
          row = (max_height - height) * 0.5,
          col = (max_width - width) * 0.5,
        }
      end,
      additional_presets = {
        project_local = {
          command_name = "PNote",
          filename = "notes.md",
          title = "Project Note",
        },
      },
      post_open = function(_, _)
        vim.bo.filetype = "markdown"
      end,
    },
    keys = {
      { "<localleader>n", "<CMD> PNote <CR>", desc = "Open project note" },
      { "<localleader>N", "<CMD> Note <CR>", desc = "Open global note" },
    },
  },
  {
    dir = "~/repos/jaimecgomezz/notes.nvim",
    opts = {},
    keys = {
      {
        "<leader>nn",
        function()
          require("notes").toggle_note()
        end,
        desc = "Open project note",
      },
    },
  },
}
