-- Fix broken highlight groups until colorschemes update
require('plugin.treesitter.fix')

vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', tag = vim.version.range('0.x') } })

local TS_CFG = {
    'python',
    'lua',
    'rust',
    'cpp',
    'c',
    'toml'
}

local treesitter = require('nvim-treesitter')

treesitter.install(TS_CFG)

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(ev)
        --vim.notify('filetype ' .. vim.inspect(ev))
        --vim.treesitter.start()
    end
})
