return function(cfgs, opt)
    require('lsp.configs.arduino_lsp')(cfgs, opt)
    require('lsp.configs.rust_analyzer')(cfgs, opt)
    require('lsp.configs.sumneko_lua')(cfgs, opt)
end
