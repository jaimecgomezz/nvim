return {
    "akinsho/toggleterm.nvim",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.5
            end
        end,
        open_mapping = [[<A-v>]],
        shading_factor = "1",
        persist_size = true,
        direction = "vertical"
    },
    config = function(_, opts) require("toggleterm").setup(opts) end
}
