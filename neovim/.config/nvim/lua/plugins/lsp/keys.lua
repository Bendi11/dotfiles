local M = {}

local trouble_mode = {
    mode = "diagnostics",
    preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
    },
}

M.set_buf_keymap = function(bufnr)
    local trouble = require('trouble')
    local function buf_set_keymap(...) vim.keymap.set(...) end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = {noremap = true, silent = true, buffer = bufnr}
    buf_set_keymap('n', 'K',  vim.lsp.buf.hover,        opts)
    buf_set_keymap('n', 'gr', vim.lsp.buf.references,   opts)
    buf_set_keymap('n', 'rn', vim.lsp.buf.rename,       opts)
    buf_set_keymap('n', 'gD', vim.lsp.buf.declaration,  opts)
    buf_set_keymap('n', 'gd', vim.lsp.buf.definition,   opts)
    buf_set_keymap('n', 'ca', vim.lsp.buf.code_action,  opts)
    buf_set_keymap('n', 'xw', function() trouble.toggle(trouble_mode) end, opts)
    buf_set_keymap(
        'n',
        '<C-e>',
        function()
            vim.diagnostic.open_float(nil, { scope = "line", border = "single" })
        end,
        opts
    )
end

M.default_on_attach = function (client, bufnr)
    M.set_buf_keymap(bufnr)
    if client.server_capabilities.inlayHintProvider then
        --vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
end



return M
