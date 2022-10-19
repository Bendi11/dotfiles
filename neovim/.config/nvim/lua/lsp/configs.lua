local function default_setup(server, opts) server:setup(opts) end

local M = {
    clangd = default_setup,
}

return vim.tbl_deep_extend(
    'force',
    M,
    require('lsp.configs.arduino_lsp'),
    require('lsp.configs.rust_analyzer'),
    require('lsp.configs.sumneko_lua')
)
