return function(cfgs, opts)
    cfgs['pyright'] = function(servername)
        local server = require('lspconfig')[servername]

        local py_opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                settings = {
                    python = {
                        pythonPath = "/usr/bin/python3"
                    }
                }
            }
        )

        server.setup(py_opts)
    end
end
