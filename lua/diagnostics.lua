return function(_)
    local sign = function(opts)
        vim.fn.sign_define(opts.name,
                           {texthl = opts.name, text = opts.text, numhl = ''})
    end

    sign({name = 'DiagnosticSignError', text = '!'})
    sign({name = 'DiagnosticSignWarn', text = 'w'})
    sign({name = 'DiagnosticSignHint', text = 'h'})
    sign({name = 'DiagnosticSignInfo', text = 'i'})

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = false
    })

    vim.cmd([[set signcolumn=yes]])
    vim.cmd(
        [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])
end
