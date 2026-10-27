
vim.pack.add({
    { src='https://github.com/nvim-telescope/telescope.nvim.git' },
    { src='https://github.com/nvim-lua/plenary.nvim.git' },
    { src='https://github.com/nvim-telescope/telescope-fzf-native.nvim.git' },
    { src='https://github.com/BurntSushi/ripgrep.git' },
    { src='https://github.com/nvim-telescope/telescope-ui-select.nvim.git' },
    { src='https://github.com/nvim-telescope/telescope-symbols.nvim.git' },
    { src='https://github.com/nvim-telescope/telescope-file-browser.nvim.git' },
})

vim.pack.add({
    {src='https://github.com/stevearc/dressing.nvim.git' }
})

local telescope = require('telescope')

telescope.setup {
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
    },
    extensions = {
        ["ui-select"] = {
            require('telescope.themes').get_dropdown {

            }
        },
        --["fzf"] = {
        --  fuzzy = true,                    -- false will only do exact matching
        --  override_generic_sorter = true,  -- override the generic sorter
        --  override_file_sorter = true,     -- override the file sorter
        --  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        --},
        ["file_browser"] = {
            theme = 'dropdown',
            hijack_netrw = true,
        },
    }
}

telescope.load_extension('ui-select')
--telescope.load_extension('fzf')
telescope.load_extension('file_browser')

require('dressing').setup {
    input = {
        default_prompt = '⥤ ',
        insert_only = true,
        win_options = {
            winblend = 50,
        },
    },
    select = {
        enabled = false,
        backend = { 'telescope' },
    }
}

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function (event)
        if event.data.spec.name == 'telescope-fzf-native.nvim'
            and (event.data.kind == 'install' or event.data.kind == 'update') then
            vim.system(
                {'make', '-C', event.data.path},
                function (out)
                    if out.code ~= 0 then
                        vim.notify('Failed to build fzf: ' .. out.stderr, vim.log.levels.ERROR)
                    end
                end
            )
        end
    end
})
