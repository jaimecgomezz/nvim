return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", 'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp-signature-help'
    },
    config = function(_, _)
        local cmp = require("cmp")

        cmp.setup({
            completion = {completeopt = "menu,menuone"},
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true
                },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                            "<Plug>luasnip-expand-or-jump",
                                            true, true, true), "")
                    else
                        fallback()
                    end
                end, {"i", "s"}),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
                                            "<Plug>luasnip-jump-prev", true,
                                            true, true), "")
                    else
                        fallback()
                    end
                end, {"i", "s"})
            },
            formatting = {
                fields = {"abbr", "kind", "menu"},
                format = function(_, item)
                    local icons = {
                        Namespace = "󰌗",
                        Text = "󰉿",
                        Method = "󰆧",
                        Function = "󰆧",
                        Constructor = "",
                        Field = "󰜢",
                        Variable = "󰀫",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "󰑭",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈚",
                        Reference = "󰈇",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "󰙅",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "󰊄",
                        Table = "",
                        Object = "󰅩",
                        Tag = "",
                        Array = "[]",
                        Boolean = "",
                        Number = "",
                        Null = "󰟢",
                        String = "󰉿",
                        Calendar = "",
                        Watch = "󰥔",
                        Package = "",
                        Copilot = "",
                        Codeium = "",
                        TabNine = ""
                    }
                    local icon = icons[item.kind] or ""
                    icon = (" " .. icon .. " ") or icon
                    item.kind = string.format("%s %s", icon, item.kind or "")
                    return item
                end
            },
            sources = {
                {name = "nvim_lsp"}, {name = "luasnip"}, {name = "nvim_lua"},
                {name = "path"}, {
                    name = 'buffer',
                    option = {
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end
                    }
                }

            }
        })

        cmp.event:on("confirm_done",
                     require("nvim-autopairs.completion.cmp").on_confirm_done())
    end
}
