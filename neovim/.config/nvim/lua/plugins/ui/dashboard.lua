return {
    -- Dashboard
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = 'VimEnter',
        config = function()
            local function footer()
                local plugins = require('lazy').stats().loaded
                local v = vim.version()
                local datetime = os.date " %d-%m-%Y   %H:%M:%S"
                return string.format(" %s   v%s.%s.%s  %s", plugins, v.major, v.minor, v.patch, datetime)
            end
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')
    
            dashboard.section.header.val = {
                "   ▐▀▄      ▄▀▌   ▄▄▄▄▄▄▄             ",
                "   ▌▒▒▀▄▄▄▄▀▒▒▐▄▀▀▒██▒██▒▀▀▄          ",
                "  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄        ",
                "  ▌▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄      ",
                "▀█▒▒█▌▒▒█▒▒▐█▒▒▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌     ",
                "▀▌▒▒▒▒▒▀▒▀▒▒▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐   ▄▄",
                "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌▄█▒█",
                "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐▒█▀ ",
                "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐▀   ",
                "▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌    ",
                " ▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐     ",
                " ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▌     ",
                "  ▌▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐      ",
                "  ▐▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▌      ",
                "    ▀▄▄▀▀▀▀▄▄▀▀▀▀▀▀▄▄▀▀▀▀▀▀▄▄▀        ",
            }
            
            dashboard.section.footer.val = footer()
            dashboard.section.buttons.val = {
                dashboard.button(" t o", "  Recently opened files", ":Telescope oldfiles<CR>"),
                dashboard.button(" t f", "  Find file", ":Telescope find_files<CR>"),
                dashboard.button(" t F", "  File browser", ":Telescope file_browser<CR>"),
                dashboard.button(" c n", "  New file", ":ene <BAR> startinsert<CR>"),
                dashboard.button(" c c", "  Update plugins", ":Lazy update<CR>"),
                dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
            }
    
            alpha.setup(dashboard.opts)
        end
    }
}
