return {
    version = "0.0.1",

    mason_tool_installer = {
        setup = {
            ensure_installed = {
                "prettier",
            },
        },
    },

    -- Map of formatters to their init functions
    formatter_init = {
        -- functions return true if the formatter should be used and
        -- false otherwise
        prettier = function()
            local prettierrcs = {
                -- in order of precidence
                -- https://prettier.io/docs/en/configuration.html
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.yml",
                ".prettierrc.yaml",
                ".prettierrc.json5",
                ".prettierrc.js",
                "prettierrc.config.js",
                ".prettierrc.mjs",
                "prettier.config.mjs",
                ".prettierrc.cjs",
                "prettier.config.cjs",
                ".prettierrc.toml",
            }
            for _, prettierrc in ipairs(prettierrcs) do
                local file = vim.fn.findfile(prettierrc, ".;")
                if file ~= "" then
                    local full_path = vim.fn.fnamemodify(file, ":p")
                    require("conform").formatters.prettier = {
                        inherit = true,
                        prepend_args = { "--config", full_path },
                    }
                    return true
                end
            end
            return false
        end,
    },

    -- Map of filetype to formatters
    formatters_by_ft = {
        angular = { "prettier" },
        css = { "prettier" },
        flow = { "prettier" },
        graphql = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        json = { "prettier" },
        jsx = { "prettier" },
        less = { "prettier" },
        markdown = { "prettier" },
        scss = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        yaml = { "prettier" },
    },
}
