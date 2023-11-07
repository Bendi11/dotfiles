return {
    -- Automatically change dir to a project root
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {
          
        }
      end
    },

    --Delimiter pairs
    {
        'windwp/nvim-autopairs',
        dependencies = {
            'hrsh7th/nvim-cmp'
        },
        config = function()
            require('nvim-autopairs').setup {}

            local autopairs_cmp = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done({ map_char = { tex = '' } }))
        end,
    }
}
