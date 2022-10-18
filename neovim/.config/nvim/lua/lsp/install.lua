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
            local lsp_installer = require("nvim-lsp-installer").setup{}
            local lspconfig = require('lspconfig')
            local keys = require('keys')
            local configs = require('configs')
            
            local lsp_opts = {
                on_attach = function(_, bufnr) keys.set_buf_keymap(bufnr) end,
            }
            local ok, cmp = pcall(require, 'cmp_nvim_lsp')
            if ok then 
                lsp_opts.capabilities = cmp.default_capabilities()
            end

            for name, setup in pairs(configs) do
                setup(lspconfig[name])
            end
            
            lsp_installer.on_server_ready(function(server)
                if server.name == "rust_analyzer" then
                    local rustopts = {
                        server = vim.tbl_deep_extend("force", server:get_default_options(), lsp_opts, {
                            on_attach = custom_attach,
                            cmd = server._default_options.cmd,
                        }),
                        tools = {
                            autoSetHints = true,
                            inlay_hints = {
                                show_parameter_hints = false,
                                other_hints_prefix = '⇒ ',
                                max_len_align = true,
                                max_len_align_padding = 3,
                            },
                        },
                    }
                    require("rust-tools").setup(rustopts)
                    server:attach_buffers()
                elseif server.name == "arduino_language_server" then
                    local FQBN = "megaTinyCore:megaavr:atxy7"
                    server:setup {
                        cmd = {
                            "arduino-language-server",
                            "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                            "-fqbn", FQBN,
                            "-cli", vim.fn.expand("~/.local/bin/arduino-cli"),
                            "-clangd", "/usr/bin/clangd"
                        }
                    }
                elseif server.name == "clangd" then
                    --opts.filetypes = {"cpp", "objc", "objcpp", "cuda"}
                    server:setup(lsp_opts)
                elseif server.name == "sumneko_lua" then
                    lsp_opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                        }
                    }
                    server:setup(lsp_opts)
                end
            
            end)
            
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
            
            local server_config = require('lspconfig.configs')
            local root_pattern = require('lspconfig.util').root_pattern
            
            server_config.zettelkasten = {
              default_config = {
                cmd = {os.getenv('HOME') .. '/.cargo/bin/zk-lsp'},
                name = 'zettelkasten',
                filetypes = {
                  'zettel',
                },
                root_dir = root_pattern('')
              }
            }
            
            
            
            M.setup = function()
                install_lsp('rust_analyzer')
                install_lsp('clangd')
                require('lspconfig').zettelkasten.setup(lsp_opts)
            end
            
            return M
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
