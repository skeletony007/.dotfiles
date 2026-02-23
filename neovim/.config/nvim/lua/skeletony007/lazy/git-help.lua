return {
    "skeletony007/git-help.nvim",

    lazy = true,

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    dir = os.getenv("PERSONAL") .. "/git-help.nvim",

    config = true,
}
