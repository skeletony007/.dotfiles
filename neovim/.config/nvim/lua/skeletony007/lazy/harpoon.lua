local function harpoon_notify(n)
    vim.notify(string.format("%s added to Harpoon %d", vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":."), n))
end

return {

    "theprimeagen/harpoon",

    branch = "harpoon2",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader><C-d>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>a<C-h>", function()
            harpoon:list():replace_at(1)
            harpoon_notify(1)
        end)
        vim.keymap.set("n", "<leader>a<C-j>", function()
            harpoon:list():replace_at(2)
            harpoon_notify(2)
        end)
        vim.keymap.set("n", "<leader>a<C-k>", function()
            harpoon:list():replace_at(3)
            harpoon_notify(3)
        end)
        vim.keymap.set("n", "<leader>a<C-l>", function()
            harpoon:list():replace_at(4)
            harpoon_notify(4)
        end)
    end,
}
