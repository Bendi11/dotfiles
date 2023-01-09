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
    }
end
