vim.pack.add({
    'file://' .. vim.uv.os_homedir() .. '/dev/minis/orbit-nvim',
    'https://github.com/rktjmp/lush.nvim.git'
})

vim.pack.add({'https://github.com/sainnhe/everforest.git'})

vim.cmd("colorscheme everforest")
