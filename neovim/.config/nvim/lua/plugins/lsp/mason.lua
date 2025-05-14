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
            require('plugins.lsp.configs')

            require("mason").setup{
                install_root_dir = require('plugins.lsp.glob').MASON_INSTALL_DIR
            }

            require('mason-lspconfig').setup {
                ensure_installed = {
                    'lua_ls',
                    'clangd',
                },
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
