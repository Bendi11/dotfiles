return function(use)
    --OneDark from the Atom text editor
    use 'navarasu/onedark.nvim'

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
                        keywords = 'bold',
                        variables = 'bold',
                    },
                },
            }

            --nightfox.load()
        end
    }
end
