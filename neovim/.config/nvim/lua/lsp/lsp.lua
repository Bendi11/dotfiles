return function(use)
    require('lsp.install')(use)

    use 'simrat39/rust-tools.nvim'

    --Preset configurations for Neovim's LSP client
    use {
        'neovim/nvim-lspconfig',
        config = function()
        end
    }
end
