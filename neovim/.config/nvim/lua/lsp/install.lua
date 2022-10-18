return function(use)
    --Helper to automatically download and install LSP servers
    use {
        'williamboman/nvim-lsp-installer',
        requires = {
            'neovim/nvim-lspconfig',
            'simrat39/rust-tools.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require("nvim-lsp-installer").setup{}
            local lsp_installer_servers = require("nvim-lsp-installer.servers")

            --Ensure a specific Language Server is installed
            local function install_lsp(name)
                local ok, requested_server = lsp_installer_servers.get_server(name)
                if ok then
                    if not requested_server:is_installed() then
                        vim.notify('Installing ' .. name, 'info', {
                            icon = '⭮',
                            title = 'LSP Installer',
                            timeout = 3000,
                        })
                        requested_server:install()
                    end
                end
            end

            install_lsp('rust_analyzer')
            install_lsp('clangd')
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
