return {
    version = "0.0.1",

    mason_tool_installer = {
        setup = {
            ensure_installed = {
                "stylua",
            },
        },
    },

    -- Map of formatters to their init functions
    formatter_init = {
        -- functions return true if the formatter should be used and
        -- false otherwise
        stylua = function()
            local file = vim.fn.findfile(".stylua.toml", ".;")
            if file == "" then
                return false
            end
            local full_path = vim.fn.fnamemodify(file, ":p")
            require("conform").formatters.stylua = {
                inherit = true,
                prepend_args = { "--config-path", full_path },
            }
            return true
        end,
    },

    -- Map of filetype to formatters
    formatters_by_ft = {
        lua = { "stylua" },
    },
}
