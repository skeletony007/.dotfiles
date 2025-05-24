return {
    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        config = function()
            local personal = require("skeletony007.personal")

            require("nvim-treesitter.configs").setup(personal.nvim_treesitter.setup)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",

        cmd = {
            "TSContextEnable",
            "TSContextDisable",
            "TSContextToggle",
        },

        dependencies = { "nvim-treesitter/nvim-treesitter" },

        config = function() require("treesitter-context").setup({ enable = false }) end,
    },
}
