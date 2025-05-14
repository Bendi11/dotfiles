local M = {}

M.MASON_INSTALL_DIR = vim.fn.stdpath "data" .. "/mason/"

local keys = require('plugins.lsp.keys')


--Setup keymaps for the buffer that a language server is attached to
M.default_lsp_opts = function ()
    local cmp_ok, cmp = pcall(require, 'cmp_nvim_lsp')
    if not cmp_ok then
        vim.notify('cmp-nvim-lsp not available, completion keymaps will not be set', vim.log.levels.ERROR)
    end

    return {
        on_attach = keys.default_on_attach,
        capabilities = cmp and cmp.default_capabilities() or nil,
    }

end

return M
