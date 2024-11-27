-- sources:
--      - https://vi.stackexchange.com/a/43436
--      - https://github.com/exosyphon/nvim/blob/main/lua/plugins/lsp.lua

local hover_close = function(base_win_id)
  local windows = vim.api.nvim_tabpage_list_wins(0)
  for _, win_id in ipairs(windows) do
    if win_id ~= base_win_id then
      local win_cfg = vim.api.nvim_win_get_config(win_id)
      if win_cfg.relative == "win" and win_cfg.win == base_win_id then
        vim.api.nvim_win_close(win_id, {})
        break
      end
    end
  end
end

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false, silent = true }

  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))

  vim.keymap.set("i", "<C-s>", function()
    vim.lsp.buf.signature_help()
  end, { desc = "LSP signature help" })

  vim.keymap.set("n", "<Esc>", function()
    hover_close(vim.api.nvim_get_current_win())
  end, vim.tbl_deep_extend("force", opts, { desc = "Close active lsp hover popup" }))

  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({ float = { border = "rounded" } })
  end, vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))

  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = { border = "rounded" } })
  end, vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))

  vim.keymap.set("n", "<leader>ld", function()
    vim.diagnostic.setloclist()
  end, vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))

  vim.keymap.set("n", "<leader>ls", function()
    vim.lsp.buf.workspace_symbol(vim.fn.expand("<cword>"))
  end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))

  vim.keymap.set("n", "<leader>lS", function()
    vim.lsp.buf.workspace_symbol()
  end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))

  vim.keymap.set("n", "<leader>la", function()
    vim.lsp.buf.code_action()
  end, vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))

  vim.keymap.set("n", "<leader>lr", function()
    vim.lsp.buf.rename()
  end, vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))
end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      "jq",
      "shfmt",
      "prettier",
      "prettierd",
      "stylua",
      "jsonlint",
      "luacheck",
      "markdownlint",
      "shellcheck",
      "sqlfluff",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "sqls",
        "lua_ls",
        "rubocop",
        "solargraph",
        "rust_analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "nanotee/sqls.nvim" },
    config = function()
      local lspconfig = require("lspconfig")

      local opts = {
        on_attach = on_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        handlers = {
          ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "single",
            title = "hover",
            max_width = 80,
            max_height = 20,
          }),

          ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
            title = "hover",
            max_width = 80,
            max_height = 20,
          }),
        },
      }

      lspconfig.clangd.setup(opts)
      lspconfig.lua_ls.setup(opts)
      lspconfig.solargraph.setup(opts)
      lspconfig.rust_analyzer.setup(opts)
      lspconfig.svelte.setup(opts)
      lspconfig.sqls.setup(vim.tbl_extend("force", opts, {
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          require("sqls").on_attach(client, bufnr)
        end,
      }))
    end,
  },
  {
    "dnlhc/glance.nvim",
    opts = {
      detached = true,
      border = {
        enable = true,
        top_char = "─",
        bottom_char = "─",
      },
      list = {
        position = "left",
        width = 0.20,
      },
      theme = {
        mode = "darken",
      },
      preview_win_opts = {
        cursorline = false,
      },
    },
    keys = {
      { "gr", "<CMD>Glance references<CR>", desc = "LSP Goto Reference" },
      { "gd", "<CMD>Glance definitions<CR>", desc = "LSP Goto Definition" },
      { "gt", "<CMD>Glance type_definitions<CR>", desc = "LSP Goto Type Definition" },
      { "gi", "<CMD>Glance implementations<CR>", desc = "LSP Goto Implementations" },
    },
  },
  {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",
        "nvim-telescope/telescope.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
      opts = {
        window = {
          border = "single",
          size = { height = "60%", width = "60%" },
          position = "50%",
        },
        lsp = {
          auto_attach = true,
        },
      },
      keys = {},
    },
  },
  {
    "mawkler/refjump.nvim",
    keys = { "]r", "[r" },
    opts = {},
  },
}
