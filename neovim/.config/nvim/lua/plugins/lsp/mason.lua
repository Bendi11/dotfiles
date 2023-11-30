return {
    --Helper to automatically download and install LSP servers
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim'
        },
        after = {
            'nvim-lspconfig',
            'cmp-nvim-lsp',
        },
        config = function()
            local ok, cmp = pcall(require, 'cmp_nvim_lsp')
            if not ok then
                vim.notify('cmp-nvim-lsp not available, completion keymaps will not be set', 'error')
            end

            --Setup keymaps for the buffer that a language server is attached to
            local default_lsp_config = {
                on_attach = function(_, bufnr) require('plugins.lsp.keys').set_buf_keymap(bufnr) end,
                capabilities = cmp and cmp.default_capabilities() or nil,
            }

            --Setup an LSP server handler table for mason-lspconfig that will setup all servers installed with mason-lspconfig by default 
            local handlers = {}
            setmetatable(
                handlers,
                {
                    __index = function ()
                        return function(server_name) require('lspconfig')[server_name]:setup(default_lsp_config) end
                    end
                }
            )

            --Apply existing LSP configurations
            require('plugins.lsp.configs')(handlers, default_lsp_config)

            require("mason").setup{
                install_root_dir = require('plugins.lsp.glob').MASON_INSTALL_DIR
            }

            require('mason-lspconfig').setup {
                ensure_installed = {
                    'rust_analyzer',
                    'lua_ls',
                    'clangd',
                },

                handlers = handlers,
            }
        end
    },

    --[[use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        --after = "neovim/nvim-lspconfig",
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config {
                virtual_lines = {
                    only_current_line = true
                },
            }
        end,
    }]]
}
