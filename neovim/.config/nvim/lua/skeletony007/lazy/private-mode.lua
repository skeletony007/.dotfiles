return {
    "skeletony007/private-mode.nvim",

    dir = os.getenv("PERSONAL") .. "/private-mode.nvim",

    config = function() require("private-mode").setup(require("skeletony007.personal").private_mode.setup) end,
}
