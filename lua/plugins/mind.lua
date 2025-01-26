return {
  "Selyss/mind.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    ui = {
      width = 60,
      highlight = {
        node_root = "Number",
      },
    },

    keymaps = {
      normal = {
        ["<cr>"] = "open_data",
        ["<s-cr>"] = "open_data_index",
        ["<tab>"] = "toggle_node",
        ["<s-tab>"] = "toggle_node",
        ["/"] = false,
        ["$"] = "change_icon_menu",
        c = "add_inside_end_index",
        I = "add_inside_start",
        i = "add_inside_end",
        y = "copy_node_link",
        Y = "copy_node_link_index",
        d = "delete",
        D = "delete_file",
        O = "add_above",
        o = "add_below",
        q = "quit",
        r = "rename",
        R = "change_icon",
        u = "make_url",
        x = "select",
      },

      selection = {
        ["<cr>"] = "open_data",
        ["<s-tab>"] = "toggle_node",
        ["/"] = false,
        I = "move_inside_start",
        i = "move_inside_end",
        O = "move_above",
        o = "move_below",
        q = "quit",
        x = "select",
      },
    },
  },
  keys = {
    {
      "<leader>mm",
      function()
        require("mind").open_project()
      end,
      desc = "Open Mind tree",
    },
    {
      "<leader>mM",
      function()
        require("mind").open_main()
      end,
      desc = "Open Mind tree",
    },
    {
      "<leader>mc",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          require("mind.commands").create_node_index(
            args.get_tree(),
            require("mind.node").MoveDir.INSIDE_END,
            args.save_tree,
            args.opts
          )
        end)
      end,
    },
    {
      "<leader>mC",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          require("mind.commands").create_node_index(
            args.get_tree(),
            require("mind.node").MoveDir.INSIDE_END,
            args.save_tree,
            args.opts
          )
        end)
      end,
    },
    {
      "<leader>mi",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          local tree = args.get_tree()
          local mind_node = require("mind.node")

          local _, tasks = mind_node.get_node_by_path(tree, "/tasks", true)
          tasks.icon = "󰗇 "

          local _, backlog = mind_node.get_node_by_path(tree, "/tasks/backlog", true)
          backlog.icon = ""

          local _, on_going = mind_node.get_node_by_path(tree, "/tasks/progress", true)
          on_going.icon = " "

          local _, done = mind_node.get_node_by_path(tree, "/tasks/done", true)
          done.icon = " "

          local _, notes = mind_node.get_node_by_path(tree, "/notes", true)
          notes.icon = " "

          args.save_tree()
        end)
      end,
    },
    {
      "<leader>ml",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          require("mind.commands").copy_node_link_index(args.get_tree(), nil, args.opts)
        end)
      end,
    },
    {
      "<leader>mL",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          require("mind.commands").copy_node_link_index(args.get_tree(), nil, args.opts)
        end)
      end,
    },
    {
      "<leader>md",
      function()
        require("mind").wrap_smart_project_tree_fn(function(args)
          require("mind.commands").open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
        end)
      end,
    },
    {
      "<leader>mD",
      function()
        require("mind").wrap_main_tree_fn(function(args)
          require("mind.commands").open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
        end)
      end,
    },
  },
}
