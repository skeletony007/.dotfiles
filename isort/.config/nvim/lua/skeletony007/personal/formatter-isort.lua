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
        isort = function()
            -- as per [PEP 518](https://peps.python.org/pep-0518/)
            local file = vim.fn.findfile("pyproject.toml", ".;")
            if file ~= "" then
                local full_path = vim.fn.fnamemodify(file, ":p")
                require("conform").formatters.isort = {
                    inherit = true,
                    prepend_args = { "--settings-file", full_path },
                }
                return true
            end
            return false
        end,
    },

    -- Map of filetype to formatters
    formatters_by_ft = {
        python = { "isort" },
    },
}
