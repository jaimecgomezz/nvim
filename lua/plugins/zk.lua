local function select_notebook(cb)
  cb = cb or function() end
  local dirs = vim.split(vim.fn.glob("~/zk/*/"), "\n", { trimempty = true })

  vim.ui.select(dirs, {
    format_item = function(item)
      local name = item

      for match in string.gmatch(item, "([^/]+)") do
        name = match
      end

      return name
    end,
  }, function(choice)
    if choice ~= nil and choice ~= "" then
      vim.fn.setenv("ZK_NOTEBOOK_DIR", choice)
      vim.fn.chdir(choice)
      cb()
    end
  end)
end

local function pick_and_run(cb)
  local notebook = vim.env.ZK_NOTEBOOK_DIR

  if notebook == nil or notebook == "" then
    select_notebook(cb)
  else
    cb()
  end
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
      select_notebook,
      desc = "Move to notes directory",
    },
    {
      "<leader>zi",
      function()
        pick_and_run(function()
          require("zk").index()
        end)
      end,
      desc = "Index notes",
    },
    {
      "<leader>zo",
      function()
        pick_and_run(function()
          require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
        end)
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
        pick_and_run(function()
          local title = vim.fn.input("Title: ")

          if title and title ~= "" then
            require("zk.commands").get("ZkNew")({ dir = "ideas", title = title })
          end
        end)
      end,
      desc = "New idea",
    },
    {
      "<leader>zt",
      function()
        pick_and_run(function()
          require("zk.commands").get("ZkTags")()
        end)
      end,
      desc = "Search notes by tags",
    },
    {
      "<leader>zf",
      function()
        pick_and_run(function()
          require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
        end)
      end,
      desc = "Search notes by name",
    },
    {
      "<leader>zb",
      function()
        pick_and_run(function()
          require("zk.commands").get("ZkBacklinks")()
        end)
      end,
      desc = "List note backlinks",
    },
    {
      "<leader>zl",
      function()
        pick_and_run(function()
          require("zk.commands").get("ZkLinks")()
        end)
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
