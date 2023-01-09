return function(use)
    --Helper to automatically download and install LSP servers
    use {
        'williamboman/mason.nvim',
        requires = {
            'williamboman/mason-lspconfig.nvim'
        },
        after = {
            'nvim-lspconfig',
            'cmp-nvim-lsp',
        },
        config = function()
            local m_lspconfig = require'mason-lspconfig'
            require("mason").setup{
                install_root_dir = require('lsp.glob').MASON_INSTALL_DIR
            }
            m_lspconfig.setup{
                ensure_installed = {
                    'rust_analyzer',
                    'sumneko_lua',
                    'clangd',
                }
            }
            
            local default_opts = {
                on_attach = function(_, bufnr) require('lsp.keys').set_buf_keymap(bufnr) end,
            }
            
            local ok, cmp = pcall(require, 'cmp_nvim_lsp')
            if ok then
                default_opts.capabilities = cmp.default_capabilities()
            end

            local configs = {
                function(server) require('lspconfig')[server].setup(default_opts) end,
            }
            require('lsp.explicit_configs')(configs, default_opts)

            m_lspconfig.setup_handlers(configs)
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
