return {
    "stevearc/conform.nvim",

    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        local conform = require("conform")
        conform.setup()
        local skeletony_conform = vim.api.nvim_create_augroup("skeletony-conform", {})

        for ft, formatters in pairs(_G.personal.formatters_by_ft) do
            vim.api.nvim_create_autocmd("FileType", {
                group = skeletony_conform,
                pattern = ft,
                callback = function()
                    for _, formatter in ipairs(formatters) do
                        if _G.personal.formatter_init[formatter]() then
                            conform.formatters_by_ft[ft] =
                                _G.personal.merge_table_recursive(conform.formatters_by_ft[ft] or {}, { formatter })
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
