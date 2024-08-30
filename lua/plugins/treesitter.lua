-- source: https://github.com/catgoose/nvim/blob/main/lua/plugins/treesitter.lua

local config = function()
    local opts = {
        ensure_installed = {
            'bash',
            'c',
            'cmake',
            'comment',
            'cpp',
            'csv',
            'diff',
            'dockerfile',
            'dot',
            'elixir',
            'erlang',
            'git_config',
            'git_rebase',
            'gitattributes',
            'gitcommit',
            'gitignore',
            'gleam',
            'go',
            'graphql',
            'haskell',
            'haskell_persistent',
            'html',
            'http',
            'hurl',
            'java',
            'javascript',
            'jq',
            'jsdoc',
            'json',
            'json5',
            'jsonnet',
            'julia',
            'just',
            'kotlin',
            'llvm',
            'lua',
            'luadoc',
            'lua',
            'make',
            'markdown',
            'markdown_inline',
            'nim',
            'nim_format_string',
            'odin',
            'pascal',
            'perl',
            'php',
            'php_only',
            'phpdoc',
            'prolog',
            'proto',
            'python',
            'r',
            'regex',
            'ruby',
            'rust',
            'scala',
            'sql',
            'ssh_config',
            'svelte',
            'todotxt',
            'toml',
            'tsv',
            'typescript',
            'typespec',
            'vim',
            'vimdoc',
            'xml',
            'yaml',
            'zathurarc',
            'zig',
        },
        highlight = {
            enable = true,
        },
        matchup = {
            enable = true,
        },
        {
            context_commentstring = {
            enable = true,
            enable_autocmd = true,
        },
        },
        textobjects = {
            lsp_interop = {
            enable = true,
            border = "rounded",
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]f"] = "@function.inner",
                    ["]e"] = "@function.outer",
                    ["]b"] = "@parameter.outer",
                    ["]d"] = "@block.inner",
                    ["]a"] = "@attribute.inner",
                    ["]m"] = "@this_method_call",
                    ["]s"] = { query = "@scope", query_group = "locals" },
                    ["]c"] = "@method_object_call",
                    ["]o"] = "@object_declaration",
                    ["]k"] = "@object_key",
                    ["]v"] = "@object_value",
                    ["]w"] = "@method_parameter",
                },
                goto_next_end = {
                    ["]F"] = "@function.inner",
                    ["]E"] = "@function.outer",
                    ["]B"] = "@parameter.outer",
                    ["]D"] = "@block.inner",
                    ["]A"] = "@attribute.inner",
                    ["]M"] = "@this_method_call",
                    ["]S"] = { query = "@scope", query_group = "locals" },
                    ["]C"] = "@method_object_call",
                    ["]O"] = "@object_declaration",
                    ["]K"] = "@object_key",
                    ["]V"] = "@object_value",
                    ["]W"] = "@method_parameter",
                },
                goto_previous_start = {
                    ["[f"] = "@function.inner",
                    ["[e"] = "@function.outer",
                    ["[b"] = "@parameter.outer",
                    ["[d"] = "@block.inner",
                    ["[a"] = "@attribute.inner",
                    ["[m"] = "@this_method_call",
                    ["[s"] = { query = "@scope", query_group = "locals" },
                    ["[c"] = "@method_object_call",
                    ["[o"] = "@object_declaration",
                    ["[k"] = "@object_key",
                    ["[v"] = "@object_value",
                    ["[w"] = "@method_parameter",
                },
                goto_previous_end = {
                    ["[F"] = "@function.inner",
                    ["[E"] = "@function.outer",
                    ["[B"] = "@parameter.outer",
                    ["[D"] = "@block.inner",
                    ["[A"] = "@attribute.inner",
                    ["[M"] = "@this_method_call",
                    ["[S"] = { query = "@scope", query_group = "locals" },
                    ["[C"] = "@method_object_call",
                    ["[O"] = "@object_declaration",
                    ["[K"] = "@object_key",
                    ["[V"] = "@object_value",
                    ["[W"] = "@method_parameter",
                },
            },
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@call.outer",
                    ["ic"] = "@call.inner",
                    ["aC"] = "@class.outer",
                    ["iC"] = "@class.inner",
                    ["ib"] = "@parameter.inner",
                    ["ab"] = "@parameter.outer",
                    ["iB"] = "@block.inner",
                    ["aB"] = "@block.outer",
                    ["id"] = "@block.inner",
                    ["ad"] = "@block.outer",
                    ["il"] = "@loop.inner",
                    ["al"] = "@loop.outer",
                    ["ia"] = "@attribute.inner",
                    ["aa"] = "@attribute.outer",
                },
            },
        },
        incremental_selection = {
            enable = true,
            keymaps = {
            node_incremental = "v",
            node_decremental = "V",
            init_selection = "<C-y>",
            scope_incremental = "<C-v>",
            },
        },
    }
  }

    require("nvim-treesitter.configs").setup(opts)

    vim.treesitter.language.register("markdown", "octo")
end

return({
    {
        "nvim-treesitter/nvim-treesitter",
        config = config,
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "CKolkey/ts-node-action",
            "nvim-treesitter/nvim-treesitter-context",
        },
    },
})