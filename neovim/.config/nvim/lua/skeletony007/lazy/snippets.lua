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

            vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })

            -- add luasnip cmp source
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, 2, { name = "luasnip" })
            config.snippet.expand = function(args) require("luasnip").lsp_expand(args.body) end
            cmp.setup(config)

            require("luasnip.loaders.from_lua").lazy_load(require("skeletony007.personal").ls.loaders.lua.opts)
        end,
    },
    {
        "rafamadriz/friendly-snippets",

        dependencies = { "L3MON4D3/LuaSnip" },

        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    },
    {
        "danymat/neogen",
        -- stable versions
        version = "*",

        dependencies = { "L3MON4D3/LuaSnip" },

        config = function()
            local neogen = require("neogen")

            neogen.setup({ snippet_engine = "luasnip" })

            -- NOTE: vim idiom capital K for cursor symbol information
            vim.keymap.set("n", "<C-s>K", function() neogen.generate() end)
        end,
    },
}
