return function(config)
    local base16 = require("base16-colorscheme")

    vim.g.transparency = config.transparency

    if config.theme == "light" then
        base16.setup({
            base00 = '#e9f1ef',
            base01 = '#ccd4d3',
            base02 = '#90b7b6',
            base03 = '#5c787b',
            base04 = '#4b5b5f',
            base05 = '#385156',
            base06 = '#0e3c46',
            base07 = '#d2faff',
            base08 = '#cf432e',
            base09 = '#d27f46',
            base0A = '#cfad25',
            base0B = '#6ca38c',
            base0C = '#329ca2',
            base0D = '#39aac9',
            base0E = '#6e6582',
            base0F = '#865369'
        })
    else
        base16.setup({
            base00 = "#1E1D2D",
            base01 = "#282737",
            base02 = "#2f2e3e",
            base03 = "#383747",
            base04 = "#414050",
            base05 = "#bfc6d4",
            base06 = "#ccd3e1",
            base07 = "#D9E0EE",
            base08 = "#F38BA8",
            base09 = "#F8BD96",
            base0A = "#FAE3B0",
            base0B = "#ABE9B3",
            base0C = "#89DCEB",
            base0D = "#89B4FA",
            base0E = "#CBA6F7",
            base0F = "#F38BA8"
        })
    end

    vim.opt.statusline = require("statusline").run()
end
