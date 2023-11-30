return function(handlers, opts)
    handlers['arduino_language_server'] = function(servername)
        local server = require('lspconfig')[servername]
        local FQBN = "megaTinyCore:megaavr:atxy7"
        opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                cmd = {
                    "arduino-language-server",
                    "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                    "-fqbn", FQBN,
                    "-cli", vim.fn.expand("~/.local/bin/arduino-cli"),
                    "-clangd", "/usr/bin/clangd"
                }
            }

        )

        server:setup(opts)
    end

    handlers['tailwindcss'] = function(servername)
        require('lspconfig')[servername].setup {
            filetypes = {
                "css",
                "scss",
                "sass",
                "postcss",
                "html",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "svelte",
                "vue",
                "rust",
            },
            init_options = {
                userLanguages = {
                    rust = "html",
                },
            },
            -- Here If any of files from list will exist tailwind lsp will activate.
            root_dir = require 'lspconfig'.util.root_pattern(
                'tailwind.config.js',
                'tailwind.config.ts',
                'postcss.config.js',
                'postcss.config.ts',
                'windi.config.ts'
            ),
        }
    end

    handlers['lua_ls'] = function(servername)
        local server = require('lspconfig')[servername]
        local runtime_path = vim.split(package.path, ";")
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")

        local lua_opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        }
                    }
                }
            }
        )

        server.setup(lua_opts)
    end

    handlers['pyright'] = function(servername)
        local server = require('lspconfig')[servername]

        local py_opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                settings = {
                    python = {
                        pythonPath = "/usr/bin/python3"
                    }
                }
            }
        )

        server.setup(py_opts)
    end

    handlers['rust_analyzer'] = function(servername)
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
                        command = require'plugins.lsp.glob'.MASON_INSTALL_DIR  .. '/codelldb',
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
