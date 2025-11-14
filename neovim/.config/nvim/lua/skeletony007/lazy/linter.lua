return {
    {
        "mfussenegger/nvim-lint",

        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {}
            local lint_group = vim.api.nvim_create_augroup("skeletony007.lint", {})
            local function lint_buffer() lint.try_lint() end

            vim.api.nvim_create_autocmd("BufWritePost", {
                group = lint_group,
                callback = lint_buffer,
            })

            vim.api.nvim_create_user_command("Lint", lint_buffer, {})

            vim.api.nvim_create_user_command("LintInfo", function()
                local linters = lint.linters_by_ft[vim.bo.filetype] or {}
                if #linters == 0 then
                    vim.notify("no linters for this buffer")
                else
                    vim.notify("linters for this buffer: " .. table.concat(linters, ", ") .. "\n")
                end
            end, {})
        end,
    },
    {
        "skeletony007/nvim-linterconfig",

        dependencies = { "mfussenegger/nvim-lint" },

        dir = os.getenv("PERSONAL") .. "/nvim-linterconfig",

        config = function()
            local formatterconfig = require("linterconfig")
            formatterconfig.golangcilint.setup()
            formatterconfig.ansible_lint.setup()
        end,
    },
}
