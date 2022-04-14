local M = {}

local lists = require("custom.plugins.lists")

M.plugins = {
    status = {
        colorizer = true,
        -- dashboard = true,
    },
    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig",
        },
    },
    install = lists,
}

M.ui = {
    theme = "onedark",
}

M.options = {
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    scrolloff = 12,
}

return M

