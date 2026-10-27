vim.api.nvim_create_autocmd(
    'PackChanged',
    {
        pattern = 'peek.nvim',
        desc = 'build peek.nvim',
        callback = function(e)
            if e.data.kind == 'install' or e.data.kind == 'update' then
                local ec = vim.system(
                    {'deno', 'task', '--quiet', 'build:fast'},
                    {cwd = 'e.data.path'}
                ):wait()

                if ec.code ~= 0 then
                    vim.notify('Failed to build peek.nvim: ' .. ec.stderr .. ec.stdout, vim.log.levels.ERROR)
                end
            end
        end
    }
)



vim.pack.add({
    'https://github.com/toppair/peek.nvim.git'
})


require("peek").setup {
    app = 'browser'
}
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
