-- helper function to parse output
local function parse_output(proc)
  local result = proc:wait()
  local ret = {}
  if result.code == 0 then
    for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
      -- Remove trailing slash
      line = line:gsub("/$", "")
      ret[line] = true
    end
  end
  return ret
end

-- build git status cache
local function new_git_status()
  return setmetatable({}, {
    __index = function(self, key)
      local ignore_proc = vim.system(
        { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
        {
          cwd = key,
          text = true,
        }
      )
      local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
        cwd = key,
        text = true,
      })
      local ret = {
        ignored = parse_output(ignore_proc),
        tracked = parse_output(tracked_proc),
      }

      rawset(self, key, ret)
      return ret
    end,
  })
end

local git_status = new_git_status()

local is_hidden_file = function(name, bufnr)
  local dir = require("oil").get_current_dir(bufnr)
  local is_dotfile = vim.startswith(name, ".") and name ~= ".."
  -- if no local directory (e.g. for ssh connections), just hide dotfiles
  if not dir then
    return is_dotfile
  end
  -- dotfiles are considered hidden unless tracked
  if is_dotfile then
    return not git_status[dir].tracked[name]
  else
    -- Check if file is gitignored
    return git_status[dir].ignored[name]
  end
end

return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = false,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
    use_default_keymaps = false,
    win_options = {
      wrap = true,
      cursorline = true,
      winbar = [[%{v:lua.require('oil').get_current_dir()}]],
    },
    view_options = {
      show_hidden = false,
      natural_order = true,
      is_hidden_file = is_hidden_file,
    },
    keymaps = {
      ["g?"] = "actions.show_help",

      -- General
      ["q"] = "actions.close",
      ["<C-r>"] = "actions.refresh",

      -- Traversing
      ["<CR>"] = "actions.select",
      ["<Tab>"] = "actions.select",
      ["l"] = "actions.select",
      ["-"] = "actions.parent",
      ["<BS>"] = "actions.parent",
      ["h"] = "actions.parent",

      -- Opening
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-t>"] = "actions.select_split",
      ["<C-S-t>"] = "actions.select_tab",
      ["p"] = "actions.preview",

      -- cwd
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",

      -- Sort
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["."] = "actions.toggle_hidden",
      ["gt"] = "actions.toggle_trash",

      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
  },
	-- stylua: ignore
	keys = {
		{ "<localleader>o", function() require("oil").open() end, desc = "Open oil", },
	},
}
