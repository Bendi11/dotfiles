local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
    vim.notify('lspconfig not loaded when configuring LSP servers', vim.log.levels.ERROR)
    return {}
end

local lsputil = require('lspconfig/util')
local keys = require('plugins.lsp.keys')

local cmp_ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not cmp_ok then
    vim.notify('cmp-nvim-lsp not available, completion keymaps will not be set', vim.log.levels.ERROR)
end

vim.lsp.config(
    '*',
    {
        on_attach = keys.default_on_attach,
        capabilities = cmp and cmp.default_capabilities() or nil,
    }
)

vim.lsp.config(
    'verible',
    {
        root_dir = function(filename)
            local path = lsputil.path.is_absolute(filename) and filename
            or lsputil.path.join(vim.loop.cwd(), filename)
            return  lsputil.root_pattern("CMakeLists.txt", "verible.filelist")(path) or lsputil.find_git_ancestor(filename) or lsputil.path.dirname(filename)
        end,
    }
)

vim.lsp.config(
    'arduino_language_server',
    {
        cmd = {
            "arduino-language-server",
            "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn", "arduino:avr:nano",
            "-cli", vim.fn.expand("/usr/bin/arduino-cli"),
            "-clangd", "/usr/bin/clangd"
        }
    }
)

vim.lsp.config(
    'tailwindcss',
    {
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
)


local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
vim.lsp.config(
    'lua_ls',
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

vim.lsp.config(
    'pyright',
    {
        settings = {
            python = {
                pythonPath = "/usr/bin/python3"
            }
        }
    }
)
