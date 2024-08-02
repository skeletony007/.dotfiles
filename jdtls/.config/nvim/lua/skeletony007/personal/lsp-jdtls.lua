return {
    version = "0.0.1",

    mason_lspconfig = {
        setup = {
            ensure_installed = {
                -- choose JAVA 17, see https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/setup-with-nvim-jdtls.md
                "jdtls",
            },
            handlers = {
                --["jdtls"] = function() end,
            },
        },
    },
}
