return {
    require('plugins.ui.dashboard'),
    require('plugins.ui.statusline'),
    require('plugins.ui.telescope'),
    require('plugins.ui.term'),
    require('plugins.ui.themes'),

    -- Preview hex color codes in editor
    {
        'norcalli/nvim-colorizer.lua',
        ft = { 'rust', 'css', 'html' },
        config = function()
            require('colorizer').setup({
                'rust';
                'css';
                'html';

            }, {
                RGB = false,
                names = false,
            })
        end
    },
    --Indent lines
    --[[{
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup()
        end
    },]]--
    -- Icons for nvim-cmp classifications
    {
        'kyazdani42/nvim-web-devicons', --Additional icons for file tree and completion menu
    },

    -- File Tree
    {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function()
            require('nvim-tree').setup({
                disable_netrw = false,
                hijack_netrw = false,
                update_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true
                },
                diagnostics = {
                    enable = true,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
            })

        end
    },


    -- LSP diagnostics browser
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            local signs = {
                -- icons / text used for a diagnostic
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "",
            }

            local vim_signs = {
                Error = signs.error,
                Warn = signs.warning,
                Hint = signs.hint,
                Info = signs.information,
            }

            -- Define neovim's gutter icons to match trouble's
            for kind, icon in pairs(vim_signs) do
                local highlight = "DiagnosticSign" .. kind
                vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = '' })
            end

            require('trouble').setup {
                fold_open = "",
                fold_closed = "",
                signs = signs,
            }
        end
    },

    --Buffer tabs that look nice and display lsp diagnostics
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'kyazdani42/nvim-web-devicons'
        },
        config = function()
            require('bufferline').setup {
                options = {
                    --separator_style = "padded_slant",
                    diagnostics = "nvim_lsp",
                    offsets = {{
                            filetype = 'NvimTree',
                            text = 'Files',
                            text_align = 'center',
                            highlight = 'Directory',
                        }
                    }
                }
            }
        end
    },

    --Popup notifications
    {
        'rcarriga/nvim-notify',
        config = function()
            local notify = require('notify')
            notify.setup {
                max_width = 50,
                max_height = 10,
                stages = 'slide',
            }

            vim.notify = notify
            end
    },
}
