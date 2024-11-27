return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<leader>hh", function()
        local item = harpoon:list():get_by_value(vim.fn.expand("%"))

        if not item then
          harpoon:list():add()
        else
          harpoon:list():remove()
        end
      end)

      for n = 1, 9 do
        vim.keymap.set("n", "<leader>" .. n, function()
          harpoon:list():select(n)
        end)

        vim.keymap.set("n", "<leader>h" .. n, function()
          harpoon:list():replace_at(n)
        end)
      end

      vim.keymap.set("n", "<leader><leader>", function()
        local file_paths = {}
        for _, item in ipairs(harpoon:list().items) do
          table.insert(file_paths, item.value)
        end

        local tvalues = require("telescope.config").values
        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = tvalues.file_previewer({}),
            sorter = tvalues.generic_sorter({}),
          })
          :find()
      end, { desc = "Open harpoon window" })

      vim.keymap.set("n", "<leader>hx", function()
        harpoon:list():clear()
      end, { desc = "Open harpoon window" })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      jump = {
        autojump = true,
      },
      label = {
        after = false,
        before = true,
      },
      modes = {
        char = {
          autohide = true,
          jump_labels = true,
        },
        treesitter_search = {
          search = { incremental = true },
          label = {
            before = true,
            after = false,
            style = "overlay",
          },
        },
      },
      prompt = { enabled = false },
    },
        -- stylua: ignore
        keys = {
            { "s", function() require("flash").jump() end, desc = "Flash", mode = { "n", "x" } },
            { "r", function() require("flash").remote() end, desc = "Remote Flash", mode = "o" },
            { "?", function() require("flash").treesitter_search() end, desc = "Treesitter Search", mode = { "n", "o", "x" } },
            { "<C-s>", function() require("flash").toggle() end, desc = "Toggle Flash Search", mode = { "c" } },
        },
  },
  {
    "MattesGroeger/vim-bookmarks",
    init = function()
      vim.g.bookmark_no_default_key_mappings = 1
      vim.g.bookmark_save_per_working_dir = 1
      vim.g.bookmark_auto_save = 1
    end,
    keys = {
      { "mm", "<CMD> BookmarkToggle <CR>", desc = "Toggle bookmark" },
      {
        "mM",
        function()
          vim.ui.input({ prompt = "Comment: " }, function(comment)
            if comment ~= nil and comment ~= "" then
              cmd = "BookmarkAnnotate " .. comment
              vim.cmd(cmd)
            end
          end)
        end,
        desc = "Toggle commentary bookmark",
      },
      { "mn", "<CMD> BookmarkNext <CR>", desc = "Next bookmark" },
      { "mp", "<CMD> BookmarkPrev <CR>", desc = "Previous bookmark" },
      { "ml", "<CMD> BookmarkShowAll <CR>", desc = "Show all bookmark" },
      { "mx", "<CMD> BookmarkClearAll <CR>", desc = "Clear all bookmark" },
    },
  },
}
