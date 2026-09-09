vim.pack.add({
    { src = 'https://github.com/nvim-tree/nvim-tree.lua.git' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons.git' }
})

local nvim_tree = require('nvim-tree')

local opts = {
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
    view = {
        width = 40,
    }
}

nvim_tree.setup(opts)

vim.keymap.set(
    'n',
    '<C-n>',
    function() require('nvim-tree.api').tree.toggle() end,
    {
        desc = 'Toggle nvim-tree file browser',
        noremap = true,
        silent = true,
        nowait = true,
    }
)

vim.pack.add({'https://github.com/ahmedkhalf/project.nvim.git'})
require("project_nvim").setup {}
