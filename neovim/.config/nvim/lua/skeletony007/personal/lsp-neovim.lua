return {
    version = "0.0.1",

    mason_lspconfig = {
        setup = {
            ensure_installed = {},
            handlers = {
                function(server_name) require("lspconfig")[server_name].setup({}) end,
            },
        },
    },
}
