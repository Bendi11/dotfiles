vim.pack.add({
    { src='https://github.com/akinsho/bufferline.nvim.git' },
    { src='https://github.com/kyazdani42/nvim-web-devicons.git' }
})

require('bufferline').setup {
    options = {
        --separator_style = "padded_slant",
        diagnostics = "nvim_lsp",
        offsets = {{
                filetype = 'NvimTree',
                text = 'Files',
                text_align = 'center',
                highlight = 'Directory',
            }
        }
    }
}
