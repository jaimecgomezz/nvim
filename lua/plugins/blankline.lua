return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        indentLine_enabled = 1,
        filetype_exclude = {
            "help", "terminal", "lazy", "lspinfo", "TelescopePrompt",
            "TelescopeResults", "mason", "nvdash", "nvcheatsheet", "startify"
        },
        buftype_exclude = {"terminal"},
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = false
    },
    config = function(_, opts) require("indent_blankline").setup(opts) end
}
