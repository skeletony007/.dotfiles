return {
    "folke/todo-comments.nvim",

    -- NOTE: nvim start screen doesn't show otherwise
    event = "VimEnter",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function() require("todo-comments").setup({ signs = false }) end,
}
