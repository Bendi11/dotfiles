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
            local executors = require('rustaceanvim.executors')

            local keys = require('plugins.lsp.keys')

            vim.g.rustaceanvim = {
                server = {
                    on_attach = keys.default_on_attach,
                    default_settings = {
                        ['rust-analyzer'] = {
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },
                                procMacro = {
                                    enable = true,
                                }
                            }
                        }
                    }
                },
                tools = {
                    executor = executors.toggleterm,
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
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            floating_window_above_cur_line = true,
            doc_lines = 0,
            max_height = 3,
            max_width = 360,
            close_timeout = 1000,
            hint_enable = false,
            hint_inline = function () return true end,
            handler_opts = {
                border = "none",
            },
            hint_prefix = "",
            transparency = 30,
        },
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    }
}
