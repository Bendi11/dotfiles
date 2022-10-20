return function(use)
    --Helper to automatically download and install LSP servers
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim'
        },
        config = function()
            require("mason").setup{
                install_root_dir = require('lsp.glob').MASON_INSTALL_DIR
            }
            require("mason-lspconfig").setup{
                ensure_installed = {
                    'rust_analyzer',
                    'sumneko_lua',
                    'clangd',
                }
            }
        end
    }

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
end
