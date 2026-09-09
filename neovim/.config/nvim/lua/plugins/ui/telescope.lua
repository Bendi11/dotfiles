return {
    --Fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-symbols.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
        config = function()

        end
    },

    --Extension to telescope that should improve performace
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    -- Plugin that uses telescope for selection menus
    {
        '',
        config = function()
            `
        end,
    }
}
