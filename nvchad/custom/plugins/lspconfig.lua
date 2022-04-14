local M = {}

local function lsp_config_clangd(attach, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.clangd.setup({
        on_attach = attach,
        capabilities = capabilities,
    })
end

local function lsp_config_sumneko_lua(attach, capabilities)
    local lspconfig = require("lspconfig")

    local sumneko_root_path = "~/.lsp/sumneko_lua"
    local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

    -- Make runtime files discoverable to the server
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    lspconfig.sumneko_lua.setup({
        cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
        on_attach = attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 500,
        },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path,
                },
                workspace = {
                    library = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        -- [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    })
end

M.setup_lsp = function(attach, capabilities)
    lsp_config_clangd(attach, capabilities)
    -- lsp_config_sumneko_lua(attach, capabilities)
end

return M

