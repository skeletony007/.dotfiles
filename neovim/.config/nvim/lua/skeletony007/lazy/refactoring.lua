return {
    "ThePrimeagen/refactoring.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("refactoring").setup()

        -- prompt for a refactor to apply when the remap is triggered
        vim.keymap.set(
            { "n", "x" },
            "<leader>rca",
            function() require("refactoring").select_refactor() end,
            { desc = "[R]efactor [C]ode [A]ction" }
        )
        -- Note that not all refactor support both normal and visual mode
    end,
}
