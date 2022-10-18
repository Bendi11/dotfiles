local function merge(tbl, ...)
    for _, v in pairs(...) do
        for lsp_name, setup_fn in pairs(v) do
            tbl[lsp_name] = setup_fn
        end
    end

    return tbl
end

local function default_setup(server, opts) server:setup(opts) end

local M = {
    clangd = default_setup,
}

return merge(
    M,
    require('configs.arduino_lsp'),
    require('configs.clangd'),
    require('configs.rust_analyzer'),
    require('configs.sumneko_lua')
)
