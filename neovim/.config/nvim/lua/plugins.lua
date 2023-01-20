return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' --Plugin Manager

    --Install all color themes
    require('plugins.themes')(use)
    


    require('plugins.markdown')(use)
    require('plugins.dashboard')(use)
    require('plugins.statusline')(use)
    require('lsp.lsp')(use)
    require('plugins.cmp')(use)

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


    use {
        'kyazdani42/nvim-web-devicons', --Additional icons for file tree and completion menu
    }


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
    }

    use {
        'folke/trouble.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
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
    }

    --Popup notifications
    use {
        'rcarriga/nvim-notify',
        config = function()
            local notify = require('notify')
            vim.notify = notify
            notify.setup({
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
            -- Undepreceate highlight groups until colorschemes update
            require('plugins.ts-fix')
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


    --Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
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
    }

    --Extension to telescope that should improve performace
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }

    -- Plugin that uses telescope for selection menus
    use {
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
    
    --Vim popup API implementation
    use {
        'nvim-lua/popup.nvim',
        opt = true,
    }

    --Searchable cheatsheet
    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
        cmd = { 'Cheatsheet', 'CheatsheetEdit' },
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
                    t:change_dir(vim.fn.getcwd())
                    --vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
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
    --[[use {
        'Pocco81/auto-save.nvim',
        event = 'InsertLeave',
        config = function()
            require('auto-save').setup {
                trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
                	-- function that determines whether to save the current buffer or not
                	-- return true: if buffer is ok to be saved
                	-- return false: if it's not ok to be saved
                condition = function(buf)
                    local fn = vim.fn
                    local utils = require("auto-save.utils.data")
                    if
                        fn.getbufvar(buf, "&modifiable") == 1 and
                        utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                        return true -- met condition(s), can save
                    end
                    return false -- can't save
                end,
                execution_message = {
                    message = function() return "autosaved" end,
                    dim = 0.18,
                    cleaning_interval = 1000,
                },
            }
        end
    }]]
end)
