return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm"
            }
        },
        ident = {enable = true},
        auto_install = true,
        matchup = {enable = true},
        ensure_installed = {
            "bash", "dockerfile", "dot", "go", "graphql", "html", "http",
            "javascript", "json", "json5", "lua", "make", "python", "ruby",
            "rust", "toml", "yaml"
        },
        highlight = {
            enable = true,
            use_languagetree = true,
            disable = {"latex"}
        },
        indent = {enable = true},
        actions = {
            open_file = {quit_on_open = true},
            change_dir = {enable = true, global = true}
        },
        view = {width = 30, side = "left"},
        hijack_cursor = true,
        update_cwd = true,
        disable_netrw = false,
        hijack_netrw = false,
        hijack_directories = {enable = true, auto_open = false},
        renderer = {
            root_folder_label = false,
            indent_markers = {enable = true},
            icons = {
                glyphs = {
                    git = {
                        staged = "✓",
                        ignored = "~",
                        unstaged = "Ξ",
                        untracked = "+",
                        unmerged = "µ",
                        deleted = "✕",
                        renamed = "≌"
                    }
                }
            }
        },
        respect_buf_cwd = true
    },
    build = ":TSUpdate",
    cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end
}
