return {
    {
        "L3MON4D3/LuaSnip",

        version = "v2.*",

        build = "make install_jsregexp",

        config = function()
            local ls = require("luasnip")

            vim.keymap.set({ "i" }, "<C-s>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
    {
        "danymat/neogen",

        version = "*",

        dependencies = { "L3MON4D3/LuaSnip" },

        config = function()
            local neogen = require("neogen")

            neogen.setup({ snippet_engine = "luasnip" })

            -- NOTE: vim idiom capital K for cursor symbol information
            vim.keymap.set("n", "<C-s>K", function() neogen.generate() end)
        end,
    },
    {
        "rafamadriz/friendly-snippets",

        dependencies = { "L3MON4D3/LuaSnip" },

        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    },
}
