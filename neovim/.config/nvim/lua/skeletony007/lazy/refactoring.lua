return {
    "ThePrimeagen/refactoring.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("refactoring").setup()

        -- prompt for a refactor to apply when the remap is triggered
        vim.keymap.set({ "n", "x" }, "<leader>rca", function() require("refactoring").select_refactor() end)
        -- Note that not all refactor support both normal and visual mode
        -- Remeber the is [R]efactor [C]ode [A]ction
    end,
}
