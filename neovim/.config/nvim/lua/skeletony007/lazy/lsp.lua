return {
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function()
                                local bufs = {}
                                for _, win in ipairs(vim.api.nvim_list_wins()) do
                                    local buf = vim.api.nvim_win_get_buf(win)
                                    local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                                    if byte_size < 1048576 then -- 1 Megabyte max
                                        table.insert(bufs, buf)
                                    end
                                end
                                return bufs
                            end,
                        },
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",

        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup(_G.personal.mason_lspconfig.setup)
        end,
    },
}
