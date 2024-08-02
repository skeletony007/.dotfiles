return {
    version = "0.0.1",

    mason_lspconfig = {
        setup = {
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
            },
        },
    },
}
