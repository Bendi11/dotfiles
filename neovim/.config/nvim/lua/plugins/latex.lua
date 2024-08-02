return {
    {
        'lervag/vimtex',
        config = function ()
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_latexmk_build_dir = 'build'
        end
    }
}
