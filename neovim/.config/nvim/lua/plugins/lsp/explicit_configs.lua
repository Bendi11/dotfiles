return function(cfgs, opt)
    require('plugins.lsp.configs.arduino_lsp')(cfgs, opt)
    require('plugins.lsp.configs.rust_analyzer')(cfgs, opt)
    require('plugins.lsp.configs.lua_ls')(cfgs, opt)
    require('plugins.lsp.configs.pyright')(cfgs, opt)
end
