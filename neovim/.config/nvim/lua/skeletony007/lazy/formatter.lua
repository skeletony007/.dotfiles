return {
    "stevearc/conform.nvim",

    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        local personal = require("skeletony007.personal")

        local conform = require("conform")
        conform.setup()
        local group = vim.api.nvim_create_augroup("skeletony007.conform", {})

        for ft, formatters in pairs(personal.formatters_by_ft) do
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = ft,
                callback = function()
                    for _, formatter in ipairs(formatters) do
                        if personal.formatter_init[formatter]() then
                            conform.formatters_by_ft[ft] =
                                personal.merge_table_recursive(conform.formatters_by_ft[ft] or {}, { formatter })
                        elseif conform.formatters_by_ft[ft] then
                            conform.formatters_by_ft[ft] = vim.tbl_filter(
                                function(entry) return entry ~= formatter end,
                                conform.formatters_by_ft[ft]
                            )
                        end
                    end
                end,
            })
        end

        vim.keymap.set(
            { "n", "v" },
            "gq",
            function()
                conform.format({
                    lsp_fallback = true,
                    timeout_ms = 500,
                })
            end
        )
    end,
}
