return {
    version = "0.0.1",

    mason_tool_installer = {
        setup = {
            ensure_installed = {
                "vale",
            },
        },
    },

    -- Map of linters to their init functions
    linter_init = {
        -- functions return true if the linter should be used and
        -- false otherwise
        vale = function()
            local file = vim.fn.findfile(".vale.ini", ".;")
            if file == "" then
                return false
            end
            return true
        end,
    },

    -- Map of filetype to linters
    linters_by_ft = {
        markdown = { "vale" },
        latex = { "vale" },
    },
}
