return function(use)
    require('lsp.install')(use)
    require('lsp.dap')(use)

    use {
        'simrat39/rust-tools.nvim',
        module = 'rust-tools',
    }

    --Preset configurations for Neovim's LSP client
    use {
        'neovim/nvim-lspconfig',
        --after = 'mason.nvim',
        config = function()
            local keys = require('lsp.keys')
            local lspconfig = require('lspconfig')
            local configs = require('lsp.configs')

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
                else 
                    vim.notify('Language Server ' .. name .. ' configured but not found', 'error')
                end
            end
        end
    }
end
