local M = {}

local function merge(...)
    for _, v in pairs(...) do
        for lsp_name, setup_fn in pairs(v) do
            M[lsp_name] = setup_fn
        end
    end

    return M
end


return merge(
    require('configs.arduino_lsp'),
    require('configs.clangd'),
    require('configs.rust_analyzer'),
    require('configs.sumneko_lua')
)
