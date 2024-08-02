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
                    { name = "buffer" },
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
