return {
    --OneDark from the Atom text editor
    'navarasu/onedark.nvim',

    'rktjmp/lush.nvim',

    {
        dir = '~/dev/minis/orbit-nvim',
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            vim.cmd("colorscheme orbit")
        end,
    },

    'rebelot/kanagawa.nvim',

    {
        'savq/melange',
    },

    --[[use {
        'aktersnurra/no-clown-fiesta.nvim',
        config = function()
            require('no-clown-fiesta').setup {
                comments = 'italic',
            }
        end
    }]]

    {
        'mcchrish/zenbones.nvim',
        requires = 'rktjmp/lush.nvim'
    },

    {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = 'night'
            vim.g.tokyonight_italic_keywords = false
        end
    },

    {
        'EdenEast/nightfox.nvim',
        config = function()
            local nightfox = require('nightfox')
            nightfox.setup {
                options = {
                    styles = {
                        comments = 'italic',
                        --keywords = 'bold',
                        --variables = 'standout',
                        constants = 'bold',
                        --functions = 'italic',
                    },
                },
            }
        end
    },
}
