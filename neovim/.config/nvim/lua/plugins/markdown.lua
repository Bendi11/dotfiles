return function(use)
    use {
        'renerocksai/calendar-vim',
        cmd = { 'CalendarVR', 'CalendarT', 'CalendarH', 'Calendar' },
    }

    use {
        'renerocksai/telekasten.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'renerocksai/calendar-vim',
        },
        ft = 'markdown',
        config = function()
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
    }

    --[[use {
        'itchyny/calendar.vim'
    }]]
    
    
end
