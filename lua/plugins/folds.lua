local config = function()
    require('ufo').setup({
        provider_selector = function(_bufnr, _filetype, _buftype)
            return {'treesitter', 'indent'}
        end
    })

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end

return({
    'kevinhwang91/nvim-ufo',
    config = config,
    dependencies = 'kevinhwang91/promise-async',
})
