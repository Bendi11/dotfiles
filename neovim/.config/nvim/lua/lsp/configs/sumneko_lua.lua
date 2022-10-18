return {
    sumneko_lua = function(server, opts)
        opts = vim.tbl_deep_extend(
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

        server:setup(opts)
    end
}
