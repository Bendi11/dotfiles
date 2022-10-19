return function(use)
    vim.keymap.set(
        'n',
        'db',
        function()
            require('dapui').toggle()
        end
    )

    vim.keymap.set(
        'n',
        'de',
        function()
            vim.ui.input('Evaluate', function(input)
                require('dapui').evaluate(input)
            end)
        end
    )

    use {
        'mfussenegger/nvim-dap',
        module = 'dap',
        config = function()
            
        end
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'},
        module = 'dapui',
        config = function()
            require('dapui').setup {

            }
        end
    }
end
