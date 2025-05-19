local function pick_and_run(cb)
  local dirs = vim.split(vim.fn.glob("~/zk/*/"), '\n', { trimempty = true })
  vim.ui.select(dirs, {
    format_item = function(item)
      local name = item

      for match in string.gmatch(item, "([^/]+)") do
        name = match
      end

      return name
    end
  }, function(choice)
    if choice ~= nil and choice ~= '' then
      vim.fn.setenv('ZK_NOTEBOOK_DIR', choice)
      cb()
    end
  end)
end

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
      desc = "Move to notes directory",
    },
    {
      "<leader>zi",
      function()
        require("zk").index()
      end,
      desc = "Index notes",
    },
    {
      "<leader>zo",
      function()
        require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
      end,
      desc = "Open note",
    },
    {
      "<leader>zn",
      function()
        pick_and_run(function()
          local title = vim.fn.input("Title: ")

          if title and title ~= "" then
            require("zk.commands").get("ZkNew")({ dir = "notes", title = title })
          end
        end)
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
      desc = "New idea",
    },
    {
      "<leader>zt",
      function()
        require("zk.commands").get("ZkTags")()
      end,
      desc = "Search notes by tags",
    },
    {
      "<leader>zf",
      function()
        require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
      end,
      desc = "Search notes by name",
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
