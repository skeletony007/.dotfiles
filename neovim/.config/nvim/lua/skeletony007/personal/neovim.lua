return {
    version = "0.0.1",

    nvim_treesitter = {
        setup = {
            -- A list of parser names, or "all" (see https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
            ensure_installed = {
                "vimdoc",
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
        },
    },

    blink_cmp = {
        setup = {
            snippets = { preset = "luasnip" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "source_name" },
                            { "kind" },
                        },
                    },
                },
            },
        },
    },

    mason_lspconfig = {
        setup = {
            ensure_installed = {},
            handlers = {
                function(server_name)
                    local lspconfig = require("lspconfig")
                    local cmp = require("blink.cmp")
                    lspconfig[server_name].setup(cmp.get_lsp_capabilities())
                end,
            },
        },
    },

    mason_tool_installer = {
        setup = {
            ensure_installed = {},
        },
    },

    -- Map of formatters to their init functions
    formatter_init = {
        -- functions return true if the formatter should be used and
        -- false otherwise
    },

    -- Map of filetype to formatters
    formatters_by_ft = {},

    -- Map of linters to their init functions
    linter_init = {
        -- functions return true if the linter should be used and
        -- false otherwise
    },

    -- Map of filetype to linters
    linters_by_ft = {},

    -- Snippets
    ls = {
        loaders = {
            lua = {
                opts = { paths = { "./lua/skeletony007/snippets/neovim" } },
            },
        },
    },

    private_mode = {
        setup = { file_patterns = {} },
    },
}
