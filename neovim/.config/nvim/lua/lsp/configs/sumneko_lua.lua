return function(cfgs, opts)
    cfgs['sumneko_lua'] = function(servername)
        local server = require('lspconfig')[servername]
        local runtime_path = vim.split(package.path, ";")
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        local lua_opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    }
                }
            }
        )

        server.setup(lua_opts)
    end
end
