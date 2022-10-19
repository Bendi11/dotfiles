local opts = { noremap = true, silent = true, buffer = 0 }

local telekasten = require('telekasten')

vim.keymap.set('n', 'zf',   telekasten.find_notes,              opts)
vim.keymap.set('n', 'zs',   telekasten.search_notes,            opts)
vim.keymap.set('n', '<CR>', telekasten.follow_link,             opts)
vim.keymap.set('n', 'zD',   telekasten.goto_today,              opts)
vim.keymap.set('n', 'zW',   telekasten.goto_thisweek,           opts)
vim.keymap.set('n', 'zn',   telekasten.new_templated_note,      opts)
vim.keymap.set('n', 'zy',   telekasten.yank_notelink,           opts)
vim.keymap.set('n', 'zt',   telekasten.toggle_todo,             opts)
vim.keymap.set('n', 'zc',   telekasten.show_calendar,           opts)
vim.keymap.set('n', 'zC',   function() telekasten.show_calendar({ cmd = 'CalendarT' }) end, opts)

vim.keymap.set('i', '<leader>[',   function() telekasten.insert_link({i = true}) end, opts)

vim.keymap.set('n', 'z',    telekasten.panel,                      opts)
vim.opt_local.textwidth = 80;
