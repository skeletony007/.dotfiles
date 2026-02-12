return {
    {
        "saghen/blink.cmp",

        version = "1.*",

        config = function()
            local cmp = require("blink.cmp")

            cmp.setup({
                sources = { default = { "lsp" } },
                keymap = {
                    preset = "none",

                    ["<C-space>"] = { "show_documentation", "hide_documentation" },
                    ["<C-e>"] = { "hide", "fallback" },
                    ["<C-y>"] = { "select_and_accept", "fallback" },

                    ["<Up>"] = { "select_prev", "fallback" },
                    ["<Down>"] = { "select_next", "fallback" },
                    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

                    --["<C-k>"] = { "snippet_forward", "fallback" },
                    --["<C-j>"] = { "snippet_backward", "fallback" },

                    --["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
                },
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
                signature = { enabled = true },
            })

            -- Imitate insert_expand
            vim.keymap.set("i", "<C-x><C-o>", function() cmp.show({ providers = { "lsp" } }) end)
            vim.keymap.set("i", "<C-x><C-p>", function() cmp.show({ providers = { "buffer" } }) end)
            vim.keymap.set("i", "<C-x><C-f>", function() cmp.show({ providers = { "path" } }) end)

            vim.keymap.set("i", "<C-x><C-j>", function() cmp.show({ providers = { "snippets" } }) end)
        end,
    },
}
