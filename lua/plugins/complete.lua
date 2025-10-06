return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    { "rafamadriz/friendly-snippets" },
    { "L3MON4D3/LuaSnip", version = "v2.*" },
  },
  opts = {
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "hide" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      -- Movement
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      menu = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        zindex = 1001,
        scrolloff = 0,
        col_offset = 0,
        side_padding = 1,
        scrollbar = true,
        draw = {
          treesitter = { "lsp" },
          columns = { { "label", gap = 1 }, { "kind_icon", "kind" } },
          components = {
            kind_icon = {
              text = function(ctx)
                return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
              end,
              highlight = "BlinkCmpMenu",
            },
            kind = {
              highlight = "BlinkCmpMenu",
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        treesitter_highlighting = true,
        window = {
          border = "single",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        sql = { "dadbod", "snippets", "buffer" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        lsp = { fallbacks = {} },
      },
    },

    fuzzy = {
      implementation = "rust",
      fuzzy = {
        sorts = {
          "exact",
          "score",
          "sort_text",
        },
      },
    },

    cmdline = {
      enabled = true,
      sources = function()
        local type = vim.fn.getcmdtype()

        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end

        -- Commands
        if type == ":" or type == "@" then
          return { "cmdline", "buffer" }
        end

        return {}
      end,
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
      },
    },

    snippets = {
      preset = "luasnip",
    },
  },

  opts_extend = { "sources.default" },
}
