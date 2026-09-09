vim.pack.add({
    'https://github.com/folke/trouble.nvim.git',
    'https://github.com/kyazdani42/nvim-web-devicons.git'
})

local signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "",
}

local vim_signs = {
    Error = signs.error,
    Warn = signs.warning,
    Hint = signs.hint,
    Info = signs.information,
}

-- Define neovim's gutter icons to match trouble's
for kind, icon in pairs(vim_signs) do
    local highlight = "DiagnosticSign" .. kind
    vim.fn.sign_define(highlight, { text = icon, texthl = highlight, numhl = '' })
end

require('trouble').setup {
    fold_open = "",
    fold_closed = "",
    signs = signs,
}
