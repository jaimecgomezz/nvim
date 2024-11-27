return {
  {
    "desdic/macrothis.nvim",
    lazy = false,
    opts = {
      run_register = "q",
      editor = { -- Edit window
        width = 80,
        height = 1,
        style = "minimal",
        border = "rounded",
      },
      default_register = "q",
    },
    init = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        require("telescope").load_extension("macrothis")
      end
    end,
    keys = {
      {
        "<leader>qd",
        function()
          require("macrothis").delete()
        end,
        desc = "delete",
      },
      {
        "<leader>qe",
        function()
          require("macrothis").edit()
        end,
        desc = "edit",
      },
      {
        "<leader>ql",
        function()
          require("macrothis").load()
        end,
        desc = "load",
      },
      {
        "<leader>qr",
        function()
          require("macrothis").rename()
        end,
        desc = "rename",
      },
      {
        "<leader>qQ",
        function()
          require("macrothis").quickfix()
        end,
        desc = "run macro on all files in quickfix",
      },
      {
        "<leader>qq",
        function()
          require("macrothis").run()
        end,
        desc = "run macro",
      },
      {
        "<leader>qs",
        function()
          require("macrothis").save()
        end,
        desc = "save",
      },
      {
        "<leader>qx",
        function()
          require("macrothis").register()
        end,
        desc = "edit register",
      },
      {
        "<leader>qy",
        function()
          require("macrothis").copy_macro_printable()
        end,
        desc = "Copy macro as printable",
      },

      -- Telescope integration
      { "<leader>fq", "<CMD> Telescope macrothis <CR>", desc = "list macros" },
    },
  },
}
