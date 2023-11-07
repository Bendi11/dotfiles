return {
    --Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
        config = function()
            local telescope = require('telescope')

            telescope.setup {
                extensions = {
                    ["ui-select"] = {
                        require('telescope.themes').get_dropdown {

                        }
                    },
                    ["fzf"] = {
                      fuzzy = true,                    -- false will only do exact matching
                      override_generic_sorter = true,  -- override the generic sorter
                      override_file_sorter = true,     -- override the file sorter
                      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    },
                    ["file_browser"] = {
                        theme = 'dropdown',
                        hijack_netrw = true,
                    }
                }
            }

            telescope.load_extension('ui-select')
            telescope.load_extension('fzf')
            telescope.load_extension('file_browser')
        end
    },

    --Extension to telescope that should improve performace
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    -- Plugin that uses telescope for selection menus
    {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup {
                input = {
                    default_prompt = '⥤ ',
                    insert_only = true,
                    win_options = {
                        winblend = 50,
                    },
                },
                select = {
                    enabled = false,
                    backend = { 'telescope' },
                }
            }
        end,
    }
}
