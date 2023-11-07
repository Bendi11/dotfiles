return {
    {
        'renerocksai/calendar-vim',
        cmd = { 'CalendarVR', 'CalendarT', 'CalendarH', 'Calendar' },
    },

    {
        'renerocksai/telekasten.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'renerocksai/calendar-vim',
        },
        ft = 'markdown',
        config = function()
            vim.cmd([[
                "hi link tkLink Directory
                exec 'hi tkLink cterm=underline gui=underline' .
                    \' guibg=' . synIDattr(synIDtrans(hlID('Directory')), 'bg', 'gui') .
                    \' ctermbg=' . synIDattr(synIDtrans(hlID('Directory')), 'bg', 'cterm') .
                    \' guifg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui')
                    
                "\' ctermfg=' . synIDattr(synIDtrans(hlID('Directory')), 'fg', 'cterm')
                hi link tkBrackets Conceal
                   
                hi link tkHighlight Cursor
                
                hi link CalNavi CalRuler
                hi link tkTagSep WinSeparator
                hi link tkTag SignColumn
            ]])

            local dir = vim.fn.expand('~/zettelkasten')
            local template = dir .. '/template'
            require'telekasten'.setup {
                home = dir,

                dailies      = dir .. '/' .. 'daily',
                weeklies     = dir .. '/' .. 'weekly',
                templates    = template,

                template_handling = 'prefer_new_note',

                new_note_filename = 'uuid',
                uuid_type = '%Y%m%d%H%M',

                template_new_note = template .. '/note.md',
                template_new_daily = template .. '/daily.md',
                template_new_weekly = template .. '/weekly.md',

                command_palette_theme = 'dropdown',

                plug_into_calendar = true,
            }
        end
    },
}
