MACHINE_SPECIFIC_CONFIG = {
    ['andromeda'] = function ()
        vim.o.guifont = 'FiraCode Nerd Font Mono:h8'
    end
}

local cfg = MACHINE_SPECIFIC_CONFIG[vim.uv.os_gethostname()]
if cfg ~= nil then cfg() else
    vim.o.guifont = 'FiraCode Nerd Font Mono:h14'
end

-- Enable mouse selection
vim.o.mouse = 'a'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true

vim.o.clipboard = 'unnamedplus'

require('plugin')
