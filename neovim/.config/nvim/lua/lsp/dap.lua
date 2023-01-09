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
                require('dapui').eval(input)
            end)
        end
    )

    vim.keymap.set(
        'n',
        'bp',
        function()
            require('dap').toggle_breakpoint()
        end
    )

    use {
        'mfussenegger/nvim-dap',
        module = 'dap',
        config = function()
         
        end
    }

    use {
        'jayp0521/mason-nvim-dap.nvim',
        after = {'mason.nvim', 'nvim-dap'},
        config = function()
            local dap = require('dap')
            require('mason-nvim-dap').setup{}
            local install_dir = require('lsp.glob').MASON_INSTALL_DIR
            require 'mason-nvim-dap'.setup_handlers {
                function(_)
                end,
                codelldb = function()
                    dap.adapters.codelldb = {
	                    type = "executable",
	                    command = install_dir .. '/bin/codelldb',
                    }

                    dap.configurations.rust = {
	                    {
	            	        type = "lldb",
	            	        request = "launch",
	            	        name = "Launch file",
	            	        program = "${file}", -- This configuration will launch the current file if used.
	                    },
                    }
                end,
            } 
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
