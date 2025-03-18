return {
    "tpope/vim-fugitive",

    dependencies = {
        "skeletony007/git-help.nvim",
    },

    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local skeletony007_fugitive_group = vim.api.nvim_create_augroup("skeletony007FugitiveGroup", {})

        vim.api.nvim_create_autocmd("FileType", {
            group = skeletony007_fugitive_group,
            pattern = "fugitive",
            callback = function(opts)
                local o = { buffer = opts.buf, remap = false }

                vim.keymap.set("n", "<leader>p", function() vim.cmd.Git("push") end, o)

                vim.keymap.set("n", "<leader>P", function() vim.cmd.Git("pull --rebase --autostash") end, o)

                vim.keymap.set(
                    "n",
                    "<leader>t",
                    string.format(
                        ":Git push --set-upstream '%s' ",
                        require("git-help").get_upstreams(vim.loop.cwd())[1] or "origin"
                    ),
                    o
                )
            end,
        })
    end,
}
