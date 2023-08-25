return function(use)

    local DEFAULT_THEME = 'melange'
    vim.cmd('colorscheme ' .. DEFAULT_THEME)

    --OneDark from the Atom text editor
    use 'navarasu/onedark.nvim'

    use 'rebelot/kanagawa.nvim'

    --[[use {
        'aktersnurra/no-clown-fiesta.nvim',
        config = function()
            require('no-clown-fiesta').setup {
                comments = 'italic',
            }
        end
    }]]

    use {
        'mcchrish/zenbones.nvim',
        requires = 'rktjmp/lush.nvim'
    }

    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = 'night'
            vim.g.tokyonight_italic_keywords = false
        end
    }

    use {
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
    }

    use 'savq/melange'
end
