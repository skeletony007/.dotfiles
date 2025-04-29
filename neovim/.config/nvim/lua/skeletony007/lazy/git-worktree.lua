return {
    "ThePrimeagen/git-worktree.nvim",

    -- dir = os.getenv("PERSONAL") .. "/git-worktree.nvim.git/master",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "skeletony007/git-help.nvim",
    },

    config = function()
        local worktree = require("git-worktree")
        local telescope = require("telescope")
        local git_help_worktree = require("git-help.worktree")

        worktree.setup()

        telescope.load_extension("git_worktree")

        -- <Enter> - switches to that worktree
        -- <c-d> - deletes that worktree
        -- <c-f> - toggles forcing of the next deletion
        vim.keymap.set(
            "n",
            "<leader>gwd",
            function() telescope.extensions.git_worktree.git_worktrees() end,
            { desc = "[G]it [W]orktree [D]irecrories" }
        )

        vim.keymap.set("n", "<leader>gwn", function()
            -- local function test_harness(path, branch, upstream)
            --     print("path: " .. path, "branch: " .. branch, "upstream: " .. upstream)
            -- end
            -- worktree.create_worktree_menu()
            worktree.create_worktree(git_help_worktree.create_worktree_menu(vim.loop.cwd()))
        end, { desc = "[G]it [W]orktree [N]ew" })
    end,
}
