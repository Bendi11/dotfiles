vim.pack.add({
    'file://' .. vim.uv.os_homedir() .. '/dev/minis/orbit-nvim',
    'https://github.com/rktjmp/lush.nvim.git'
})

vim.cmd("colorscheme orbit")
