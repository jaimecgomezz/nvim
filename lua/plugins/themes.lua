return {
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          overseer = true,
          cmp = true,
          flash = true,
          grug_far = true,
          gitsigns = true,
          neogit = true,
          noice = false,
          dap = true,
          dap_ui = true,
          notify = true,
          nvim_surround = true,
          nvimtree = true,
          treesitter = true,
          ufo = true,
          indent_blankline = { enabled = true },
          telescope = { enabled = true },
          dadbod_ui = true,
          mason = true,
          markdown = true,
          render_markdown = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          neotest = true,
          harpoon = true,
        },
      })

      vim.cmd.colorscheme("catppuccin-mocha")
    end,
    enabled = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true,
        transparent = true,
        dimInactive = false,
        theme = "wave",
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme

          return {
            -- Transparent Floating Windows
            Normal = { bg = "none" },
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Dark completion menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
          }
        end,
      })

      vim.cmd.colorscheme("kanagawa")
    end,
    enabled = true,
    priority = 1000,
  },
}
