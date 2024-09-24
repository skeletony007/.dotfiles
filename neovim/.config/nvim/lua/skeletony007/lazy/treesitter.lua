return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function() require("nvim-treesitter.configs").setup(_G.personal.nvim_treesitter.setup) end,
}

-- NOTE: cargo install tree-sitter-cli for parsers requiring
-- :TSInstallFromGrammar such as latex
