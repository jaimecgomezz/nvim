local function toggle_fugitive()
  if vim.bo.filetype == "fugitive" then
    vim.cmd("Git")
    return
  end

  -- Close any existing fugitive buffers
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buffer) == 1 then
      local buftype = vim.fn.getbufvar(buffer, "&filetype")

      if buftype == "fugitive" then
        vim.cmd("bdelete " .. buffer)
        return
      end
    end
  end

  -- If we're on a Git repository, open fugitive
  if vim.fn.finddir(".git", vim.fn.getcwd() .. ";") ~= "" then
    vim.cmd("vertical Git")

  -- Switch to a git project otherwise
  else
    vim.cmd("FzfSwitchProject")
  end
end

return {
  {
    "tpope/vim-fugitive",
		-- stylua: ignore
		keys = {
			{ "<leader>gg", toggle_fugitive, desc = "Open fugitive" },
			{ "<leader>gc", "<CMD> Git commit <CR>", desc = "Git commit" },
			{ "<leader>gp", "<CMD> Git pull <CR>", desc = "Git pull" },
			{ "<leader>gf", "<CMD> Git fetch <CR>", desc = "Git fetch" },
			{ "<leader>gs", "<CMD> Git stash <CR>", desc = "Git stash" },
			{ "<leader>gS", "<CMD> Git stash pop <CR>", desc = "Git stash pop" },
			{ "<leader>gP", "<CMD> Git push <CR>", desc = "Git push" },
			{ "<leader>gB", "<CMD> Telescope git_branches <CR>", desc = "Git branch locals" },
			{ "<leader>gl", "<CMD> vertical Git log <CR>", desc = "Commit" },
			{ "<leader>gdm", "<CMD> vertical Git diff master -- % <CR>", desc = "Diff file with master" },
			{ "<leader>gdd", "<CMD> vertical Git diff dev -- % <CR>", desc = "Diff file with dev" },
			{ "<leader>gDm", "<CMD> vertical Git diff master <CR>", desc = "Diff project with master" },
			{ "<leader>gDd", "<CMD> vertical Git diff dev <CR>", desc = "Diff project with dev" },
			{ "<Tab>", "=", ft = "fugitive", remap = true },
			{ "<BS>", "<", ft = "fugitive", remap = true },
			{
				"<leader>gG",
				function()
					vim.ui.input({ prompt = "Git command: " }, function(command)
						if command ~= nil and command ~= "" then
							cmd = "vertical Git " .. command
							vim.cmd(cmd)
						end
					end)
				end,
				desc = "Run git command",
			},
		},
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {},
		-- stylua: ignore
		keys = {
            { "ah", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" } },
            { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" } },
			{ "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
			{ "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
            { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
			{ "<leader>hp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
			{ "<leader>hS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
			{ "<leader>hR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
			{ "<leader>gb", function() require("gitsigns").blame_line({ full = true, ignore_whitespace = true }) end, desc = "Git blame line" },
			{ "<leader>hd", function() require("gitsigns").diffthis() end, desc = "Diff hunk" },
			{ "<leader>hD", function() require("gitsigns").diffthis("~") end, desc = "Diff buffer" },
			{ "<leader>hz", function() require("gitsigns").toggle_deleted() end, desc = "Toggle deleted hunks" },
			{ "<leader>hs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Stage hunk (visual)", mode = { "v" } },
			{ "<leader>hr", function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, desc = "Reset hunk (visual)", mode = { "v" } },
			{ "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]h", bang = true })
					else
						require("gitsigns").nav_hunk("next")
					end
				end, desc = "Next diff hunk" },
			{ "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[h", bang = true })
					else
						require("gitsigns").nav_hunk("prev")
					end
				end, desc = "Next diff hunk" },
		},
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = { enable_builtin = true },
		-- stylua: ignore
        keys = {
            { '<leader>go', "<CMD> Octo <CR>", desc = "Octo" }
        },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "octo",
        callback = function()
          vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
          vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
        end,
      })

      vim.treesitter.language.register("markdown", "octo")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<localleader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    init = function()
      vim.g.lazygit_floating_window_scaling_factor = 0.6
    end,
  },
}
