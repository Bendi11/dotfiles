return function(cfgs, opts)
    cfgs['arduino_language_server'] = function(servername)
        local server = require('lspconfig')[servername]
        local FQBN = "megaTinyCore:megaavr:atxy7"
        opts = vim.tbl_deep_extend(
            'force',
            opts,
            {
                cmd = {
                    "arduino-language-server",
                    "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                    "-fqbn", FQBN,
                    "-cli", vim.fn.expand("~/.local/bin/arduino-cli"),
                    "-clangd", "/usr/bin/clangd"
                }
            }

        )

        server:setup(opts)
    end
end
