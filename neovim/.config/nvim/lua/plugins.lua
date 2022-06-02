return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' --Plugin Manager

    --Install all color themes
    require('plugins.themes')(use)
 
    --Dashboard
    use {
        'goolord/alpha-nvim',
        config = function()
            require('plugins.dashboard').setup()
        end
    }

    use {
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
    }


    use 'kyazdani42/nvim-web-devicons' --Additional icons for file tree and completion menu


    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          
        }
      end
    }
    -- File Tree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            --vim.g.nvim_tree_respect_buf_cwd = 1
            require('nvim-tree').setup({
                disable_netrw = false,
                hijack_netrw = true,
                update_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true
                },
                diagnostics = {
                    enable = true,
                },
            })

        end
    }

    --Statusline plugin with powerline font support
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        config = function()
            require('lualine').setup(require('plugins.statusline'))
        end
    }
    --Extension to lualine showing LSP progress messages
    use {
        'arkav/lualine-lsp-progress',
        requires = {
            'nvim-lualine/lualine.nvim',
        }
    }
    
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() 
            require('trouble').setup {
                
            }
        end
    } 

    --Buffer tabs that look nice and display lsp diagnostics
    use {
        'akinsho/bufferline.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
        config = function()
            require('bufferline').setup {
                options = {
                    separator_style = "padded_slant",
                    diagnostics = "nvim_lsp",
                    offsets = {{
                            filetype = 'NvimTree',
                            text = 'Files',
                            text_align = 'center',
                        }
                    }
                }
            }
        end
    }

    --Fixes cursor hold times
    use {
        'antoinemadec/FixCursorHold.nvim',
        config = function()
            vim.g.cursorhold_updatetime = 1000
        end
    }

    --Pictograms next to nvim_cmp autocompletion suggestions
    use {
        'onsails/lspkind-nvim',
        requires = {
            'mortepau/codicons.nvim'
        }
    }

    --Preset configurations for Neovim's LSP client
    use {
        'neovim/nvim-lspconfig',
    }

    --Helper to automatically download and install LSP servers
    use {
        'williamboman/nvim-lsp-installer',
        requires = {
            'neovim/nvim-lspconfig',
            'simrat39/rust-tools.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require('plugins.lspinstall').setup()
        end
    }

    --Autocompletion plugin
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('plugins.cmp').setup()
        end
    }


    use 'hrsh7th/cmp-nvim-lsp' --LSP client autocompletion source
    use 'hrsh7th/cmp-buffer' --Buffer source for autocompletion
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip' --Snippets completion source

    use 'L3MON4D3/LuaSnip' --Snippets support

    --Popup notifications
    use {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
            require('notify').setup({
                stages = 'slide',
            })
        end
    }

    --Delimiter pairs
    use {
        'windwp/nvim-autopairs',
        requires = {
            'hrsh7th/nvim-cmp'
        },
        config = function()
            require('nvim-autopairs').setup {}

            local autopairs_cmp = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done({ map_char = { tex = '' } }))
        end,
    }

    --Indent lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('indent_blankline').setup({
                space_char_blankline = " ",
                show_end_of_line = false,
                show_current_context = true,
                show_current_context_start = true,
            })
        end
    }

    --Trailing whitespace removal on write
    --[[use {
        'McAuleyPenney/tidy.nvim',
        event = 'BufWritePre'
    }]]

    --Syntax highlighting with treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
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
    }
    
    --LSP extensions specific to rust, setup by the lspinstall.lua module
    --[[use {
        'simrat39/rust-tools.nvim',
        requires = {
            'neovim/nvim-lspconfig'
        },
    }]]

    --Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            local telescope = require('telescope')

            telescope.setup {
                extensions = {
                    ["ui-select"] = {
                        require('telescope.themes').get_dropdown {

                        }
                    }
                }
            }
            telescope.load_extension('ui-select')
        end
    }

    --Extension to telescope that should improve performace
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    -- Addon that uses telescope for selection menus
    --[[use {
        'stevearc/dressing.nvim',
        config = function()
            require('dressing').setup {
                input = {
                    default_prompt = '⥤ ',
                    insert_only = true,
                    winblend = 50,
                },
                select = {
                    backend = { 'telescope' },
                    --[[telescope = {
                        theme = 'dropdown',
                    },

                }
            }
        end,
    }]]

    --Searchable cheatsheet
    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            require('cheatsheet').setup {}
        end
    }

    --Opening terminals in floating windows
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup {
                size = function(term)
                    if term.direction == 'horizontal' then
                        return 15
                    elseif term.direction == 'vertical' then
                        return vim.o.columns * 0.4
                    end
                end,
                float_opts = {
                    border = 'curved',
                },
                direction = 'float',
            }

            local Terminal = require('toggleterm.terminal').Terminal;
            local lazygit = Terminal:new({
                cmd = 'lazygit',
                --hidden = true,
                close_on_exit = true,
                on_open = function(t) 
                    function close_lazygit() 
                        t:close()
                    end
                    t:change_dir(vim.fn.getcwd())
                    vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                    --t:send('lazygit')
                end,
            })

            function _G.toggle_lazygit()
                lazygit:toggle()
            end

            function setup_term_keymaps() 
                local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
                map('t', [[<C-\>]], "<cmd>ToggleTerm<CR>", {noremap = true, silent = false})
            end
            
            vim.api.nvim_set_keymap('n', 'nq', '<cmd>lua toggle_lazygit()<CR>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', [[<C-\>]], "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
            vim.cmd('autocmd! TermOpen term://* lua setup_term_keymaps()')
        end
    }

    --Automatically write buffer when exiting insert mode
    use {
        'Pocco81/AutoSave.nvim',
        event = 'InsertLeave',
        config = function()
            require('autosave').setup {
                events = {'InsertLeave'},
                execution_message = 'autosaved',
            }
        end
    }
end)
