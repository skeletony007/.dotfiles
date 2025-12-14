return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },

        tag = "0.1.8",

        config = function()
            local telescope_group = vim.api.nvim_create_augroup("skeletony007.telescope", {})

            local telescope = require("telescope")
            telescope.setup({
                pickers = {
                    find_files = {
                        follow = true,
                    },
                },
            })

            require("telescope").load_extension("ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files)
            vim.keymap.set("n", "<C-p>", builtin.git_files)
            vim.keymap.set("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)
            vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
            vim.keymap.set("n", "<leader>vh", builtin.help_tags)

            vim.api.nvim_create_autocmd("LspAttach", {
                group = telescope_group,
                callback = function(event)
                    local map = function(keys, func, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf })
                    end

                    -- Remap GLOBAL DEFAULTS keymaps
                    -- vim.lsp.buf.code_action uses vim.ui.select, so
                    -- telescope-ui-select handles this
                    --map("gra", vim.lsp.buf.code_action, { "n", "x" })
                    map("grr", builtin.lsp_references)
                    map("gri", builtin.lsp_implementations)
                    map("grt", builtin.lsp_type_definitions)
                    map("gO", builtin.lsp_document_symbols)

                    -- Additional keymaps
                    map("gW", builtin.lsp_dynamic_workspace_symbols)
                end,
            })
        end,
    },
}
