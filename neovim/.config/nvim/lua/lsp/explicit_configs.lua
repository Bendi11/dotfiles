return function(cfgs, opt)
    require('lsp.configs.arduino_lsp')(cfgs, opt)
    require('lsp.configs.rust_analyzer')(cfgs, opt)
    require('lsp.configs.lua_ls')(cfgs, opt)
    require('lsp.configs.pyright')(cfgs, opt)
end
