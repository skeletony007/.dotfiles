return {
    "ThePrimeagen/git-worktree.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        local worktree = require("git-worktree")
        local telescope = require("telescope")

        worktree.setup()

        telescope.load_extension("git_worktree")

        vim.keymap.set("n", "<leader>gwd", function() telescope.extensions.git_worktree.git_worktrees() end)
        -- <Enter> - switches to that worktree
        -- <c-d> - deletes that worktree
        -- <c-f> - toggles forcing of the next deletion
        -- [G]it [W]orktree [D]irecrories

        vim.keymap.set("n", "<leader>gwn", function() telescope.extensions.git_worktree.create_git_worktree() end)
        -- [G]it [W]orktree [N]ew (from a branch or a new branch)

        worktree.on_tree_change(function(op, metadata)
            if op == worktree.Operations.Switch then
                print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
            end
        end)
    end,
}
