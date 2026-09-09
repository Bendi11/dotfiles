vim.pack.add({
    'https://github.com/mason-org/mason.nvim.git',
    'https://github.com/williamboman/mason-lspconfig.git'
})

local keys = require('plugin.lsp.keys')
keys.setup_keymaps()

require("mason").setup{
    install_root_dir = vim.fn.stdpath("data") .. "/mason/"
}

require('mason-lspconfig').setup {
    ensure_installed = {
        'lua_ls',
        'clangd',
    },
}
