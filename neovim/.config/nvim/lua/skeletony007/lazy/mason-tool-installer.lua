return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    dependencies = {
        "williamboman/mason.nvim",
    },

    config = function() require("mason-tool-installer").setup(_G.personal.mason_tool_installer.setup) end,
}
