local note_extension_loaded = false

return {
    "skeletony007/note.nvim",

    cmd = { "Note" },

    keys = {
        {
            "<leader>vn",
            function()
                local telescope = require("telescope")
                if not note_extension_loaded then
                    telescope.load_extension("note")
                    note_extension_loaded = true
                end
                telescope.extensions.note.find_notes()
            end,
            "n",
            desc = "[V]iew [N]otes",
        },
    },

    dependencies = {
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        local note = require("note")
        note.setup({ root = string.format("%s/notes", os.getenv("PERSONAL")) })
    end,
}
