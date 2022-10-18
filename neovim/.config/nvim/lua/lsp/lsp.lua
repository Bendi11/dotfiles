


return function(use)
    --Preset configurations for Neovim's LSP client
    use {
        'neovim/nvim-lspconfig',
        config = function()
            local keys = require('keys')
            local lspconfig = require('lspconfig')
            local configs = require('configs')

            local lsp_opts = {
                on_attach = function(_, bufnr) keys.set_buf_keymap(bufnr) end,
            }
            local ok, cmp = pcall(require, 'cmp_nvim_lsp')
            if ok then
                lsp_opts.capabilities = cmp.default_capabilities()
            end

            for name, setup in pairs(configs) do
                local server = lspconfig[name]
                if server then
                    setup(server, lsp_opts)
                end
            end
        end
    }
end
