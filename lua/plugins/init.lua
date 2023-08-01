local M = {
    plugins = {
        {
            require("plugins.others"), require("plugins.blankline"),
            require("plugins.treesitter"), require("plugins.gitsigns"),
            require("plugins.mason"), require("plugins.cmp"),
            require("plugins.luasnip"), require("plugins.lspconfig"),
            require("plugins.comment"), require("plugins.nvimtree"),
            require("plugins.telescope"), require("plugins.startify"),
            require("plugins.toggleterm"), require("plugins.projects"),
            require("plugins.tags"), require("plugins.null"),
            require("plugins.dap")
        }
    },
    options = {
        defaults = {lazy = false},
        ui = {
            icons = {
                ft = "",
                lazy = "󰂠 ",
                loaded = "",
                not_loaded = ""
            }
        },
        performance = {
            rtp = {
                disabled_plugins = {
                    "2html_plugin", "tohtml", "getscript", "getscriptPlugin",
                    "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings",
                    "netrwFileHandlers", "matchit", "tar", "tarPlugin",
                    "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin",
                    "zip", "zipPlugin", "tutor", "rplugin", "syntax", "synmenu",
                    "optwin", "compiler", "bugreport", "ftplugin",
                    "editorconfig"
                }
            }
        }
    }
}

return M
