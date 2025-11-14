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

        config = function() require("mason-lspconfig").setup() end,
    },
}
