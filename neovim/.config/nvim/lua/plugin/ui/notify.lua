vim.pack.add({'https://github.com/rcarriga/nvim-notify.git'})


local notify = require('notify')
notify.setup {
    max_width = 50,
    max_height = 10,
    stages = 'slide',
}

vim.notify = notify
