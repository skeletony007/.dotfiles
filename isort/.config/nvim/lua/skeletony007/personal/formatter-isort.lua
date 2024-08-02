return {
    version = "0.0.1",

    mason_tool_installer = {
        setup = {
            ensure_installed = {
                "isort",
            },
        },
    },

    -- Map of formatters to their init functions
    formatter_init = {
        -- functions return true if the formatter should be used and
        -- false otherwise
        isort = function() return true end,
    },

    -- Map of filetype to formatters
    formatters_by_ft = {
        python = { "isort" },
    },
}
