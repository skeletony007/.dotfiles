return {
    {
        "stevearc/conform.nvim",

        config = function()
            local conform = require("conform")
            conform.setup()
            local conform_group = vim.api.nvim_create_augroup("skeletony007.conform", {})

            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function(args)
                    local bufnr = args.buf
                    local formatters_by_ft = conform.formatters_by_ft[vim.bo[bufnr].filetype]
                    if formatters_by_ft == nil or vim.tbl_isempty(formatters_by_ft) == true then
                        return
                    end
                    vim.keymap.set(
                        { "n", "v" },
                        "gq",
                        function()
                            conform.format({
                                lsp_fallback = true,
                                timeout_ms = 500,
                            })
                        end,
                        { buffer = bufnr }
                    )
                end,
                group = conform_group,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    local bufnr = args.buf
                    local formatters_by_ft = conform.formatters_by_ft[vim.bo[bufnr].filetype]
                    if client:supports_method("textDocument/formatting") then
                        if formatters_by_ft ~= nil and vim.tbl_isempty(formatters_by_ft) == false then
                            return
                        end
                        vim.keymap.set(
                            { "n", "v" },
                            "gq",
                            function()
                                conform.format({
                                    lsp_format = "prefer",
                                    timeout_ms = 500,
                                })
                            end,
                            { buffer = bufnr }
                        )
                    end
                end,
                group = conform_group,
            })
        end,
    },
    {
        "skeletony007/nvim-formatterconfig",

        dependencies = { "stevearc/conform.nvim" },

        dir = os.getenv("PERSONAL") .. "/nvim-formatterconfig",

        config = function()
            local formatterconfig = require("formatterconfig")
            formatterconfig.black.setup()
            formatterconfig.isort.setup()
            formatterconfig.prettier.setup()
            formatterconfig.shfmt.setup()
            formatterconfig.stylua.setup()
        end,
    },
}
