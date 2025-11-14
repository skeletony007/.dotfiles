return {
    "skeletony007/private-mode.nvim",

    dir = os.getenv("PERSONAL") .. "/private-mode.nvim",

    config = function() require("private-mode").setup({ file_patterns = { "*/pass.*/*" } }) end,
}
