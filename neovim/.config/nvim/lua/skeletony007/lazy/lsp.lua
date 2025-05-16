return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "saghen/blink.cmp",

        version = "1.*",

        dependencies = {
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local cmp = require("blink.cmp")
            local personal = require("skeletony007.personal")

            cmp.setup(personal.blink_cmp.setup)
        end,
    },
}
