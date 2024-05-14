return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",

        dependencies = {
            "hrsh7th/nvim-cmp",
            "saadparwaiz1/cmp_luasnip",
        },

        config = function()
            local ls = require("luasnip")

            vim.keymap.set({ "i", "s" }, "<C-s>n", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>p", function() ls.jump(-1) end, { silent = true })

            -- add luasnip cmp source
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "luasnip" })
            cmp.setup(config)
        end,
    },
    {
        "rafamadriz/friendly-snippets",

        config = function() end,
    },
    {
        "danymat/neogen",

        config = function()
            local neogen = require("neogen")

            neogen.setup({ snippet_engine = "luasnip" })

            -- NOTE: vim idiom capital K for docs (commenting/javadoc/sjdoc etc.)
            vim.keymap.set({ "i", "s" }, "<C-s>K", function() neogen.generate() end)
        end,
        -- stable versions
        version = "*",
    },
}
