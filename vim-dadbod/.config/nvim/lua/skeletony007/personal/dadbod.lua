return {
    version = "0.0.1",

    blink_cmp = {
        setup = {
            sources = {
                per_filetype = {
                    sql = { 'dadbod', 'path', 'snippets', 'buffer' },
                },
                -- add vim-dadbod-completion to your completion providers
                providers = {
                    dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
                },
            },
        },
    },
}
