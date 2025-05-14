local glob = require('plugins.lsp.glob')

local config = vim.tbl_deep_extend(
    'force',
    glob.default_lsp_opts(),
    {
        cmd = {glob.MASON_INSTALL_DIR .. 'bin/jdtls'},
        root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    }
)

require('jdtls').start_or_attach(config)
