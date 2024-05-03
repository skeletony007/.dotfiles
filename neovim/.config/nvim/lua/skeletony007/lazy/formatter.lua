return {
    "stevearc/conform.nvim",

    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua",
            },
        })

        local conform = require("conform")
        conform.setup()
        local skeletony_conform = vim.api.nvim_create_augroup("skeletony-conform", {})

        -- Map of formatters to their init functions
        local formatter_init = {
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
                        conform.formatters.prettier = { prepend_args = { "--config", file } }
                        return true
                    end
                end
                return false
            end,
            stylua = function()
                local file = vim.fn.findfile(".stylua.toml", ".;")
                if file ~= "" then
                    conform.formatters.stylua = { prepend_args = { "--config-path", file } }
                    return true
                end
                return false
            end,
        }

        -- Map of filetype to formatters
        local formatters_by_ft = {
            angular = { "prettier" },
            css = { "prettier" },
            flow = { "prettier" },
            graphql = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            jsx = { "prettier" },
            less = { "prettier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            scss = { "prettier" },
            typescript = { "prettier" },
            vue = { "prettier" },
            yaml = { "prettier" },
        }

        for ft, formatters in pairs(formatters_by_ft) do
            for _, formatter in ipairs(formatters) do
                vim.api.nvim_create_autocmd("BufWinEnter", {
                    group = skeletony_conform,
                    callback = function()
                        if vim.bo.filetype ~= ft then
                            return
                        end

                        if formatter_init[formatter]() then
                            local formaters_ft = conform.formatters_by_ft[ft] or {}
                            if not vim.tbl_contains(formaters_ft, formatter) then
                                table.insert(formaters_ft, formatter)
                                conform.formatters_by_ft[ft] = formaters_ft
                                vim.api.nvim_out_write(
                                    'loaded formatter "' .. formatter .. '" for filetype "' .. ft .. '"\n'
                                )
                            end
                        elseif conform.formatters_by_ft[ft] then
                            conform.formatters_by_ft[ft] = vim.tbl_filter(function(entry)
                                if entry == formatter then
                                    vim.api.nvim_out_write(
                                        'unloaded formatter "' .. formatter .. '" for filetype "' .. ft .. '"\n'
                                    )
                                    return false
                                else
                                    return true
                                end
                            end, conform.formatters_by_ft[ft])
                        end
                    end,
                })
            end
        end

        vim.keymap.set(
            { "n", "v" },
            "<leader>f",
            function()
                conform.format({
                    lsp_fallback = true,
                    timeout_ms = 500,
                })
            end
        )
    end,
}
