return {
    -- Debug Adapter Protocol
    {'mfussenegger/nvim-dap'}, {
        -- Pretty UI
        'rcarriga/nvim-dap-ui',
        dependencies = {'mfussenegger/nvim-dap'},
        config = function()
            local dap = require("dap")
            local dapui = require('dapui')

            dapui.setup()

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end
    }, {
        -- Python DAP
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        dependencies = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
        config = function(_, _)
            require("dap-python").setup(
                '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

        end
    }, { -- Ruby DAP
        'suketa/nvim-dap-ruby',
        ft = 'ruby',
        dependencies = {'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui'},
        config = function() require('dap-ruby').setup() end
    }
}
