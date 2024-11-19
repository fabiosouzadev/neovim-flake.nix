local treesitter = require 'nvim-treesitter.configs'
local treesitter_context = require 'treesitter-context'
treesitter.setup {
    auto_install = false,
    ensure_installed = {},
    highlight = { enable = true },
    ignore_install = {},
    indent = { enable = true },
    modules = {},
    rainbow = { enable = true },
    sync_install = false,
}

treesitter_context.setup()