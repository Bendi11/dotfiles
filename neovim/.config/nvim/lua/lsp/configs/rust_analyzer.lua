return {
    rust_analyzer = function(server, opts)
        local rustopts = {
            server = vim.tbl_deep_extend("force", opts, {
                cmd = server._default_options.cmd,
            }),
            tools = {
                autoSetHints = true,
                inlay_hints = {
                    show_parameter_hints = false,
                    other_hints_prefix = '⇒ ',
                    max_len_align = true,
                    max_len_align_padding = 3,
                },
            },
        }

        local ok, rust_tools = pcall(require, 'rust-tools')
        if not ok then
            server:setup(rustopts.server)
        else
            rust_tools.setup(rustopts)
        end
    end,
}
