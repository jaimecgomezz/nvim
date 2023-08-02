return function(config)
    local catppuccin = require("catppuccin")

    if config.theme == "light" then
        catppuccin.setup({flavour = "frappe"})
    else
        catppuccin.setup({flavour = "mocha"})
    end

    vim.cmd.colorscheme("catppuccin")
    vim.g.transparency = config.transparency
end
