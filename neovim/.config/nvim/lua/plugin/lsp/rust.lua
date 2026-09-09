vim.pack.add({
    { src='https://github.com/mrcjkb/rustaceanvim.git', version=vim.version.range('^9') }
})

local executors = require('rustaceanvim.executors')

local keys = require('plugin.lsp.keys')

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
