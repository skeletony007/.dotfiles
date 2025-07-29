return {
    {
        "mason-org/mason.nvim",

        config = function() require("mason").setup() end,
    },
    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim",
        },

        config = function()
            local personal = require("skeletony007.personal")
            require("mason-lspconfig").setup(personal.mason_lspconfig.setup)
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        dependencies = {
            "mason-org/mason.nvim",
        },

        config = function()
            local personal = require("skeletony007.personal")
            require("mason-tool-installer").setup(personal.mason_tool_installer.setup)
        end,
    },
}
