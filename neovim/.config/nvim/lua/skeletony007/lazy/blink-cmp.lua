return {
    {
        "saghen/blink.cmp",

        dependencies = { "L3MON4D3/LuaSnip" },

        version = "1.*",

        config = function()
            local cmp = require("blink.cmp")

            cmp.setup({
                snippets = { preset = "luasnip" },
                sources = { default = { "lsp" } },
                completion = {
                    menu = {
                        auto_show = false,
                        draw = {
                            columns = {
                                { "label", "label_description", gap = 1 },
                                { "source_name" },
                                { "kind" },
                            },
                        },
                    },
                },
            })

            -- Imitate insert_expand
            vim.keymap.set("i", "<C-x><C-o>", function() cmp.show({ providers = { "lsp" } }) end)
            vim.keymap.set("i", "<C-x><C-p>", function() cmp.show({ providers = { "buffer" } }) end)
            vim.keymap.set("i", "<C-x><C-f>", function() cmp.show({ providers = { "path" } }) end)

            vim.keymap.set("i", "<C-x><C-j>", function() cmp.show({ providers = { "snippets" } }) end)
        end,
    },
}
