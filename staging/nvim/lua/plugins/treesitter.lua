return {
    --Syntax highlighting with treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            -- Undepreceate highlight groups until colorschemes update
            require('treesitter.fix')
            require('nvim-treesitter.configs').setup{
                --ensure_installed = "all",
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                }
            }
        end,
    },
}
