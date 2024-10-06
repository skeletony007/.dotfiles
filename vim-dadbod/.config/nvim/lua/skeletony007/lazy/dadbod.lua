return {
    "kristijanhusak/vim-dadbod-completion",

    dependencies = {
        "tpope/vim-dadbod",
        "hrsh7th/nvim-cmp",
    },

    cmd = "DB",

    ft = { "sql", "mysql" },

    config = function()
        -- add vim-dadbod-completion cmp source
        local cmp = require("cmp")
        local config = cmp.get_config()
        table.insert(config.sources, 2, { name = "vim-dadbod-completion" })

        cmp.setup(config)
    end,
}
