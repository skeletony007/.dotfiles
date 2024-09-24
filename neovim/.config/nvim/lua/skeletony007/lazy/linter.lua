return {
    "mfussenegger/nvim-lint",

    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {}
        local skeletony007_lint_group = vim.api.nvim_create_augroup("skeletony007LintGroup", {})

        for ft, linters in pairs(_G.personal.linters_by_ft) do
            vim.api.nvim_create_autocmd("FileType", {
                group = skeletony007_lint_group,
                pattern = ft,
                callback = function()
                    for _, linter in ipairs(linters) do
                        if _G.personal.linter_init[linter]() then
                            lint.linters_by_ft[ft] =
                                _G.personal.merge_table_recursive(lint.linters_by_ft[ft] or {}, { linter })
                        elseif lint.linters_by_ft[ft] then
                            lint.linters_by_ft[ft] = vim.tbl_filter(
                                function(entry) return entry ~= linter end,
                                lint.linters_by_ft[ft]
                            )
                        end
                    end
                end,
            })
        end

        vim.api.nvim_create_autocmd("BufWritePost", {
            group = skeletony007_lint_group,
            callback = function() lint.try_lint() end,
        })

        vim.api.nvim_create_user_command("Lint", function() lint.try_lint() end, {})

        vim.api.nvim_create_user_command("LintInfo", function()
            local linters = lint.linters_by_ft[vim.bo.filetype] or {}
            if #linters == 0 then
                vim.api.nvim_out_write("no linters for this buffer\n")
            else
                vim.api.nvim_out_write("linters for this buffer: " .. table.concat(linters, ", ") .. "\n")
            end
        end, {})
    end,
}
