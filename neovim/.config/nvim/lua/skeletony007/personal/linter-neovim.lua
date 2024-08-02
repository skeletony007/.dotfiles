return {
    version = "0.0.1",

    mason_tool_installer = {
        setup = {
            ensure_installed = {},
        },
    },

    -- Map of linters to their init functions
    linter_init = {
        -- functions return true if the linter should be used and
        -- false otherwise
    },

    -- Map of filetype to linters
    linters_by_ft = {},
}
