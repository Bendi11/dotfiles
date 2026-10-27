vim.pack.add({ {src='https://github.com/neovim/nvim-lspconfig.git'} })

local lspconfig = require('lspconfig')

local lsputil = require('lspconfig/util')


vim.pack.add({ {src='https://github.com/hrsh7th/cmp-nvim-lsp.git'} })

local cmp_ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not cmp_ok then
    vim.notify('cmp-nvim-lsp not available, completion keymaps will not be set', vim.log.levels.ERROR)
end

vim.lsp.config(
    '*',
    {
        capabilities = cmp_ok and cmp.default_capabilities() or nil,
    }
)

vim.lsp.config(
    'verible',
    {
        root_dir = function(filename)
            local path = lsputil.path.is_absolute(filename) and filename or vim.loop.cwd() .. filename
            return lsputil.root_pattern("CMakeLists.txt", "verible.filelist")(path) or lsputil.find_git_ancestor(filename) or vim.fs.dirname(filename)
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


vim.lsp.config(
    'lua_ls',
    {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                },
                workspace = {
                    library = {
                        vim.env.VIMRUNTIME,
                    },
                },
                telemetry = {
                    enable = false,
                }
            }
        }
    }
)

vim.lsp.config(
    'basedpyright',
    {
        settings = {
            basedpyright = {
                analysis = {
                    diagnosticMode = 'workspace'
                }
            },
            python = {
                pythonPath = "/usr/bin/python3"
            }
        }
    }
)
