return function(use)
    -- Handles links, markdown formatting
    use {
        'vimwiki/vimwiki',
        setup = function() 
            vim.g.vimwiki_list = {{
                path = '~/zettelkasten/',
                syntax = 'markdown',
                ext = '.md',
                auto_generate_links = 1,
                auto_toc = 1,
            }}
            vim.g.vimwiki_hl_cb_checked = 1
            vim.g.vimwiki_hl_headers = 1
        end
    }

    use {
        'itchyny/calendar.vim'
    }
    
    -- Telescope with vimwiki notes
    use {
        'ElPiloto/telescope-vimwiki.nvim',
        requires = {'nvim-telescope/telescope.nvim'},
        config = function()
            require('telescope')
                .load_extension('vimwiki')
        end
    }
end
