return {
    {
        "danymat/neogen",

        version = "*",

        config = function()
            local neogen = require("neogen")

            neogen.setup({ snippet_engine = "nvim" })

            -- NOTE: vim idiom capital K for cursor symbol information
            vim.keymap.set("n", "<C-s>K", function() neogen.generate() end)
        end,
    },
    { "rafamadriz/friendly-snippets" },
}
