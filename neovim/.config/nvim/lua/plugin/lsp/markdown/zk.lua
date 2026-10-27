vim.pack.add({
    'https://github.com/zk-org/zk-nvim.git'
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {'markdown'},
    callback = function()
        vim.keymap.set(
            'n',
            '<CR>',
            vim.lsp.buf.definition,
            {noremap = true, silent = true}
        )
    end
})

require("zk").setup {
    picker = 'telescope',
}
