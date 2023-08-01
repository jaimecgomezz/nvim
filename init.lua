local function load(config, modules)
    for _, module in ipairs(modules) do require(module)(config) end
end

load({
    -- leaders
    leader = [[\]],
    localleader = [[,]],

    -- theme
    theme = "dark",
    transparency = false
}, {"options", "autocmds", "mappings", "diagnostics", "laziest", "theme"})
