return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    dependencies = {
        "williamboman/mason.nvim",
    },

    config = function()
        local personal = require("skeletony007.personal")

        require("mason-tool-installer").setup(personal.mason_tool_installer.setup)
    end,
}
