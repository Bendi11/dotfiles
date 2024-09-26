local cmp_ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not cmp_ok then
    vim.notify('cmp-nvim-lsp not available, completion keymaps will not be set', vim.log.levels.ERROR)
end

local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then
    vim.notify('lspconfig not loaded when configuring LSP servers', vim.log.levels.ERROR)
    return {}
end

local lsputil = require('lspconfig/util')

--Setup keymaps for the buffer that a language server is attached to
local opts = {
    on_attach = require('plugins.lsp.keys').default_on_attach,
    capabilities = cmp and cmp.default_capabilities() or nil,
}

local lspconfutil = require 'lspconfig/util'
local root_pattern = lspconfutil.root_pattern("veridian.yml", ".git")
--[[require('lspconfig').veridian.setup {
    cmd = { 'veridian' },
    root_dir = function(fname)
        local filename = lspconfutil.path.is_absolute(fname) and fname
        or lspconfutil.path.join(vim.loop.cwd(), fname)
        return root_pattern(filename) or lspconfutil.path.dirname(filename)
    end;
}]]

return {
    function (servername)
        if servername == nil then
            vim.notify('servername is nil', vim.log.levels.ERROR)
            return
        end

        lspconfig[servername].setup(opts)
    end,
    ["verible"] = function ()
        local root_pattern = lsputil.root_pattern("CMakeLists.txt", "verible.filelist")

        local verible_opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                root_dir = function(filename)
                    local path = lsputil.path.is_absolute(filename) and filename
                    or lsputil.path.join(vim.loop.cwd(), filename)

                    return root_pattern(path) or lsputil.find_git_ancestor(filename) or lsputil.path.dirname(filename)
                end,
            }
        )

        lspconfig.verible.setup(verible_opts)
    end,

    ["arduino_language_server"] = function()
        local server = lspconfig.arduino_language_server
        local FQBN = "arduino:avr:nano"
        local ardu_opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                cmd = {
                    "arduino-language-server",
                    "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                    "-fqbn", FQBN,
                    "-cli", vim.fn.expand("/usr/bin/arduino-cli"),
                    "-clangd", "/usr/bin/clangd"
                }
            }

        )

        server.setup(ardu_opts)
    end,

    ["tailwindcss"] = function()
        lspconfig.tailwindcss.setup {
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
    end,

    ["lua_ls"] = function()
        local server = lspconfig.lua_ls
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
    end,

    ["pyright"] = function()
        local server = lspconfig.pyright

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
    end,

    ["rust_analyzer"] = function()
        vim.notify("rust_analyzer Mason setup called, but rustaceanvim already installed", vim.log.levels.ERROR)
    end
}
