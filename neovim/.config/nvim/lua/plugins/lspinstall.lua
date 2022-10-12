local M = {}

local lsp_installer = require("nvim-lsp-installer")

local custom_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.keymap.set(...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local cmd = vim.api.nvim_command

    local opts = {noremap = true, silent = true, buffer = bufnr}
    buf_set_keymap('n', 'K',  vim.lsp.buf.hover,        opts)
    buf_set_keymap('n', 'gr', vim.lsp.buf.references,   opts)
    buf_set_keymap('n', 'rn', vim.lsp.buf.rename,       opts)
    buf_set_keymap('n', 'gD', vim.lsp.buf.declaration,  opts)
    buf_set_keymap('n', 'gd', vim.lsp.buf.definition,   opts)
end


local combined_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_opts = {
    capabilities = combined_capabilities,
    on_attach = custom_attach,
}

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
    else
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

require('lspconfig').zettelkasten.setup(lsp_opts)

M.setup = function()
    install_lsp('rust_analyzer')
    install_lsp('clangd')
    --
end

return M
