return {
    version = "0.0.1",

    nvim_treesitter = {
        setup = {
            -- A list of parser names, or "all" (see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
            ensure_installed = {
                "markdown",
                "markdown_inline",
            },
        },
    },
}
