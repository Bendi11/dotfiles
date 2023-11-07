return {
    --Opening terminals in floating windows
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup {
                size = function(term)
                    if term.direction == 'horizontal' then
                        return 15
                    elseif term.direction == 'vertical' then
                        return vim.o.columns * 0.4
                    end
                end,
                float_opts = {
                    border = 'curved',
                },
                direction = 'vertical',
                open_mapping = [[<c-\>]],
            }

            local Terminal = require('toggleterm.terminal').Terminal;
            local lazygit = Terminal:new({
                cmd = 'lazygit',
                --hidden = true,
                close_on_exit = true,
                on_open = function(t)
                    t:change_dir(vim.fn.getcwd())
                    --vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                    --t:send('lazygit')
                end,
            })

            function _G.toggle_lazygit()
                lazygit:toggle()
            end

            vim.api.nvim_set_keymap('n', 'nq', '<cmd>lua toggle_lazygit()<CR>', {noremap = true, silent = true})
        end
    }
}
