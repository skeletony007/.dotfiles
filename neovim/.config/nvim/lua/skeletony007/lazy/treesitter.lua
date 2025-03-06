return {
    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        config = function() require("nvim-treesitter.configs").setup(_G.personal.nvim_treesitter.setup) end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",

        dependencies = { "nvim-treesitter/nvim-treesitter" },

        config = function() require("treesitter-context").setup({ enable = false }) end,
    },
}
