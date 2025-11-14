return {
    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
                ensure_installed = {
                    "lua",
                    "vimdoc",
                    "diff",
                    "git_config",
                    "git_rebase",
                    "gitcommit",
                    "gitignore",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    -- false will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",

        cmd = "TSContext",

        dependencies = { "nvim-treesitter/nvim-treesitter" },

        config = function() require("treesitter-context").setup({ enable = false }) end,
    },
}
