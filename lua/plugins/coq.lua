return {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    dependencies = {{'ms-jpq/coq.artifacts', branch = 'artifacts'}},
    init = function()
        vim.g.coq_settings = {
            auto_start = "shut-up",
            keymap = {manual_complete = ""},
            clients = {snippets = {warn = {}}},
            display = {
                pum = {source_context = {"", ""}},
                preview = {
                    border = {
                        {"╭", "NormalFloat"}, {"─", "NormalFloat"},
                        {"╮", "NormalFloat"}, {"│", "NormalFloat"},
                        {"╯", "NormalFloat"}, {"─", "NormalFloat"},
                        {"╰", "NormalFloat"}, {"│", "NormalFloat"}
                    }
                }
            }
        }

        require("coq")
    end
}
