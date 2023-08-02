return {
    { -- Theme
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
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
        init = function() vim.cmd([[filetype plugin on]]) end
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
    }
}
