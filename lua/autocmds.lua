return function(_)
    -- Disable some default providers
    for _, provider in ipairs {"node", "perl", "python3", "ruby"} do
        vim.g["loaded_" .. provider .. "_provider"] = 0
    end

    -- Add binaries installed by mason.nvim to path
    vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. ":" .. vim.env.PATH

    -- Prevent QuickFix files to be listed
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function() vim.opt_local.buflisted = false end
    })
end
