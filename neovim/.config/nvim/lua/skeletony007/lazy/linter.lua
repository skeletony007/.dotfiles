return {
    "mfussenegger/nvim-lint",

    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "ansible-lint",
                "vale",
            },
        })

        local lint = require("lint")
        lint.linters_by_ft = {}
        local skeletony_lint = vim.api.nvim_create_augroup("skeletony-lint", {})

        -- Map of linters to their init functions
        local linter_init = {
            -- functions return true if the linter should be used and
            -- false otherwise
            ansible_lint = function()
                local file = vim.fn.findfile(".ansible-lint", ".;")
                if file == "" then
                    return false
                end
                -- https://github.com/mfussenegger/nvim-lint/blob/HEAD/lua/lint/linters/ansible_lint.lua
                lint.linters.ansible_lint.args = { "-c", file, "-p", "--nocolor" }
                return true
            end,
            vale = function()
                local file = vim.fn.findfile(".vale.ini", ".;")
                if file == "" then
                    return false
                end
                -- TODO: for some reason this doesn't work (fix this)
                -- we can let vale search for the config file itself
                -- - https://github.com/mfussenegger/nvim-lint/blob/HEAD/lua/lint/linters/vale.lua

                --lint.linters.vale.args = { "--no-exit", "--output", "JSON", "--config", file }
                return true
            end,
        }

        -- Map of filetype to linters
        local linters_by_ft = {
            yaml = { "ansible_lint" },
            markdown = { "vale" },
        }

        for ft, linters in pairs(linters_by_ft) do
            for _, linter in ipairs(linters) do
                vim.api.nvim_create_autocmd("BufWinEnter", {
                    group = skeletony_lint,
                    callback = function()
                        if vim.bo.filetype ~= ft then
                            return
                        end

                        if linter_init[linter]() then
                            local linters_ft = lint.linters_by_ft[ft] or {}
                            if not vim.tbl_contains(linters_ft, linter) then
                                table.insert(linters_ft, linter)
                                lint.linters_by_ft[ft] = linters_ft
                                vim.api.nvim_out_write('loaded linter "' .. linter .. '" for filetype "' .. ft .. '"\n')
                            end
                        elseif lint.linters_by_ft[ft] then
                            lint.linters_by_ft[ft] = vim.tbl_filter(function(entry)
                                if entry == linter then
                                    vim.api.nvim_out_write(
                                        'unloaded linter "' .. linter .. '" for filetype "' .. ft .. '"\n'
                                    )
                                    return false
                                else
                                    return true
                                end
                            end, lint.linters_by_ft[ft])
                        end
                    end,
                })
            end
        end

        vim.api.nvim_create_autocmd("BufWritePost", {
            group = skeletony_lint,
            callback = function() lint.try_lint() end,
        })

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
