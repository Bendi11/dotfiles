local M = {}

M.set_buf_keymap = function(bufnr)
    local function buf_set_keymap(...) vim.keymap.set(...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = {noremap = true, silent = true, buffer = bufnr}
    buf_set_keymap('n', 'K',  vim.lsp.buf.hover,        opts)
    buf_set_keymap('n', 'gr', vim.lsp.buf.references,   opts)
    buf_set_keymap('n', 'rn', vim.lsp.buf.rename,       opts)
    buf_set_keymap('n', 'gD', vim.lsp.buf.declaration,  opts)
    buf_set_keymap('n', 'gd', vim.lsp.buf.definition,   opts)
end

return M
