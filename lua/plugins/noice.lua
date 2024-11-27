return {
  {
    "folke/noice.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = {
      messages = { enabled = false },
      popupmenu = { enabled = false },
      notify = { enabled = true },
      lsp = {
        message = { enabled = true },
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
      },
      redirect = {
        view = "vsplit",
      },
      views = {
        confirm = {
          border = {
            style = "single",
          },
        },
        mini = {
          position = {
            row = 1,
          },
          border = {
            style = "single",
          },
          win_options = {
            winblend = 0,
          },
        },
      },
    },
    keys = {
      {
        "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        desc = "Redirect cmdline",
        mode = "c",
      },
    },
  },
}
