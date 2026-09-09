return {
    --Preset configurations for Neovim's LSP client
    {
        'neovim/nvim-lspconfig',
    },

    require('plugins.lsp.mason'),

    'mfussenegger/nvim-jdtls',

    {
    },

    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            floating_window_above_cur_line = true,
            doc_lines = 0,
            max_height = 3,
            max_width = 360,
            close_timeout = 1000,
            hint_enable = false,
            hint_inline = function () return true end,
            handler_opts = {
                border = "none",
            },
            hint_prefix = "",
            transparency = 30,
        },
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    }
}
