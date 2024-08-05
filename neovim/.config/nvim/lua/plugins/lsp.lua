return {
    --Preset configurations for Neovim's LSP client
    {
        'neovim/nvim-lspconfig',
    },

    require('plugins.lsp.mason'),


    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
        config = function ()
            local keys = require('plugins.lsp.keys')
            vim.g.rustaceanvim = {
                server = {
                    on_attach = keys.default_on_attach,
                },
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
                            command = require'plugins.lsp.glob'.MASON_INSTALL_DIR  .. '/codelldb',
                            name = 'lldb'
                        }
                    }
                },
            }
        end
    }
}
