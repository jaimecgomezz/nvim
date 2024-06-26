return {
    { -- Theme
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    }, { -- White theme
      'Verf/deepwhite.nvim',
      lazy = false,
    }, {
      "zootedb0t/citruszest.nvim",
      lazy = false,
      priority = 1000,
    }, { -- Statusline
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lualine').setup() end
    }, {
        -- All the lua functions I don't want to write twice.
        "nvim-lua/plenary.nvim"
    }, {
        "nvim-tree/nvim-web-devicons",
        config = function(_, opts)
            require("nvim-web-devicons").setup(opts)
        end
    }, {
        -- Nordic colorscheme
        'AlexvZyl/nordic.nvim',
        lazy = false
    }, { -- Highlight, navigate, and operate on sets of matching text.
        "andymass/vim-matchup"
    }, { -- More useful word motions for Vim
        "chaoren/vim-wordmotion"
    }, { -- Jump to any location specified by two characters.
        "justinmk/vim-sneak"
    }, { -- Adds various text objects to give you more targets to operate on.
        "wellle/targets.vim"
    },
    { -- Disables search highlighting when you are done searching and re-enables it when you search again
        "romainl/vim-cool"
    }, { -- Fugitive is the premier Vim plugin for Git.
        "tpope/vim-fugitive"
    },
    { -- Provides mappings to easily delete, change and add such surroundings in pairs.
        "tpope/vim-surround"
    }, { -- Insert or delete brackets, parens, quotes in pair.
        "jiangmiao/auto-pairs"
    },
    { -- Adds a simple functionality that creates increasing and decreasing number or letter sequences
        "triglav/vim-visual-increment"
    }, { -- CSV support
        "chrisbra/csv.vim",
        init = function()
          vim.cmd([[filetype plugin on]])
        end
    }, { --  Undo support
        'mbbill/undotree'
    }, { -- Robust TODO and comments
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = {}
    },
    {'mfussenegger/nvim-dap', dependencies = {{'mfussenegger/nvim-dap-python'}}},
    {
        "windwp/nvim-autopairs",
        config = function(_, _)
            require("nvim-autopairs").setup({
                fast_wrap = {},
                disable_filetype = {"TelescopePrompt", "vim"}
            })
        end
    }, {
        "NvChad/nvim-colorizer.lua",
        config = function(_, opts)
            require("colorizer").setup(opts)

            -- execute colorizer as soon as possible
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end
    }, { -- Rust support
        'rust-lang/rust.vim',
        ft = 'rust',
        init = function() vim.g.rustfmt_autosave = 1 end
    }, {
        'simrat39/rust-tools.nvim',
        ft = 'rust',
        dependencies = 'neovim/nvim-lspconfig',
        config = function()
            require('rust-tools').setup({
                server = require("plugins.lspconfig").M
            })
        end
    }, {
        "folke/zen-mode.nvim",
        lazy = false,
        opts = {
            window = {
                backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 0.50 -- width of the Zen window
            },
            plugins = {
                gitsigns = {enabled = true} -- disables git signs
            }
        }
    }, { -- Zig support
        'ziglang/zig.vim'
    }, {
      'junegunn/vim-peekaboo',
    config = function ()
      vim.g.peekaboo_window='vert bo 60new'
    end
    },
    { -- folding
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async',
      config = function ()
        require('ufo').setup({
            provider_selector = function(_bufnr, _filetype, _buftype)
                return {'treesitter', 'indent'}
            end
        })
      end
    },
    -- {
    --     'renerocksai/telekasten.nvim',
    --     dependencies = {
    --         'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim'
    --     },
    --     config = function()
    --         require('telekasten').setup({home = vim.fn.expand("~/zettelkasten")})
    --     end
    -- }, {
    --     "nvim-neorg/neorg",
    --     build = ":Neorg sync-parsers",
    --     dependencies = {"nvim-lua/plenary.nvim"},
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --                 ["core.defaults"] = {}, -- Loads default behaviour
    --                 ["core.concealer"] = {}, -- Adds pretty icons to your documents
    --                 ["core.dirman"] = { -- Manages Neorg workspaces
    --                     config = {workspaces = {notes = "~/notes"}}
    --                 }
    --             }
    --         }
    --     end
    -- }
}
