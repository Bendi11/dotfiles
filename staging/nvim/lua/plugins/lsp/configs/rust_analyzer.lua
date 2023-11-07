return function(cfgs, opts)
    cfgs['rust_analyzer'] = function(servername)
        local server = require('lspconfig')[servername]
        local ok, rust_tools = pcall(require, 'rust-tools')
        if not ok then 
            vim.notify('Failed to find rust tools installed')
        end

        local rustopts = {
            server = vim.tbl_deep_extend("force", opts, {
                on_attach = function(client, bufnr)
                    if ok then
                        vim.keymap.set('n', '<C-k>', rust_tools.hover_actions.hover_actions, { buffer = bufnr, noremap = true })
                    end

                    opts.on_attach(client, bufnr)
                end
            }),
            tools = {
                autoSetHints = true,
                inlay_hints = {
                    show_parameter_hints = false,
                    other_hints_prefix = '⇒ ',
                    max_len_align = true,
                    max_len_align_padding = 3,
                },
                dap = {
                    adapter = {
                        type = 'executable',
                        command = require'lsp.glob'.MASON_INSTALL_DIR  .. '/codelldb',
                        name = 'lldb'
                    }
                }
            },
        }

        if not ok then
            server:setup(rustopts.server)
        else
            rust_tools.setup(rustopts)
        end
    end
end
