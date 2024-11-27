return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "telescope",
    })
  end,
  keys = {
    {
      "<leader>zz",
      function()
        require("zk").cd()
      end,
      desc = "Open notes",
    },
    {
      "<leader>zi",
      function()
        require("zk").index()
      end,
      desc = "Open notes",
    },
    {
      "<leader>zo",
      function()
        require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
      end,
      desc = "Open notes",
    },
    {
      "<leader>zn",
      function()
        local title = vim.fn.input("Title: ")

        if title and title ~= "" then
          require("zk.commands").get("ZkNew")({ dir = "notes", title = title })
        end
      end,
      desc = "New note",
    },
    {
      "<leader>zN",
      function()
        local title = vim.fn.input("Title: ")

        if title and title ~= "" then
          require("zk.commands").get("ZkNew")({ dir = "ideas", title = title })
        end
      end,
      desc = "New note",
    },
    {
      "<leader>zt",
      function()
        require("zk.commands").get("ZkTags")()
      end,
      desc = "Open notes matching tags",
    },
    {
      "<leader>zf",
      function()
        require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
      end,
      desc = "Search for notes",
    },
    {
      "<leader>zb",
      function()
        require("zk.commands").get("ZkBacklinks")()
      end,
      desc = "List note backlinks",
    },
    {
      "<leader>zl",
      function()
        require("zk.commands").get("ZkLinks")()
      end,
      desc = "List note links",
    },
  },
  init = function()
    local ok, telescope = pcall(require, "telescope")
    if ok then
      require("telescope").load_extension("zk")
    end
  end,
}
