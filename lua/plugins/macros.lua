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
        "<localleader>qd",
        function()
          require("macrothis").delete()
        end,
        desc = "delete",
      },
      {
        "<localleader>qe",
        function()
          require("macrothis").edit()
        end,
        desc = "edit",
      },
      {
        "<localleader>ql",
        function()
          require("macrothis").load()
        end,
        desc = "load",
      },
      {
        "<localleader>qr",
        function()
          require("macrothis").rename()
        end,
        desc = "rename",
      },
      {
        "<localleader>qQ",
        function()
          require("macrothis").quickfix()
        end,
        desc = "run macro on all files in quickfix",
      },
      {
        "<localleader>qq",
        function()
          require("macrothis").run()
        end,
        desc = "run macro",
      },
      {
        "<localleader>qs",
        function()
          require("macrothis").save()
        end,
        desc = "save",
      },
      {
        "<localleader>qx",
        function()
          require("macrothis").register()
        end,
        desc = "edit register",
      },
      {
        "<localleader>qy",
        function()
          require("macrothis").copy_macro_printable()
        end,
        desc = "Copy macro as printable",
      },

      -- Telescope integration
      { "<localleader>fq", "<CMD> Telescope macrothis <CR>", desc = "list macros" },
    },
  },
}
