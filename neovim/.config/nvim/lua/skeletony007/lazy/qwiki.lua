local telescope_extension_loaded = false

return {
    "skeletony007/qwiki.nvim",

    dependencies = {
        "nvim-telescope/telescope.nvim",
    },

    keys = {
        {
            "<leader>vm",
            function()
                local telescope = require("telescope")
                if not telescope_extension_loaded then
                    pcall(telescope.load_extension, "qwiki")
                    telescope_extension_loaded = true
                end
                telescope.extensions.qwiki.search_providers()
            end,
            "n",
            desc = "[V]iew [M]ediawiki",
        },
    },

    config = function()
        local qwiki = require("qwiki")
        local filetype = require("qwiki.filetype")

        qwiki.wikimedia:new("Wikipedia", {
            endpoint = "https://en.wikipedia.org/w/rest.php",
            -- Auth takes extra time on the first call
            -- client_id_command = "pass 'personal/wikimedia.org/Skeletony 007' | awk -F': *' '/^personal API key Client ID:/ {print $2}'",
            -- client_secret_command = "pass 'personal/wikimedia.org/Skeletony 007' | awk -F': *' '/^personal API key Client secret:/ {print $2}'",
        })
        qwiki.wikimedia:new("ArchWiki", {
            endpoint = "https://wiki.archlinux.org/rest.php",
        })

        local set_win_options_one_shot = function(buf)
            local win = vim.api.nvim_get_current_win()
            if vim.api.nvim_win_get_buf(win) ~= buf then
                return
            end
            vim.api.nvim_set_option_value("number", false, { win = win })
            vim.api.nvim_set_option_value("relativenumber", false, { win = win })
        end

        local set_win_options = function(buf)
            set_win_options_one_shot(buf)
            vim.api.nvim_create_autocmd("BufWinEnter", {
                buffer = buf,
                callback = function(args) set_win_options_one_shot(args.buf) end,
            })
        end

        filetype.mediawiki.callback = function(args)
            local buf, ref = args.buf, args.ref

            set_win_options(buf)

            vim.keymap.set("n", "<C-]>", function()
                local ok = pcall(filetype.mediawiki.follow_wikilink_under_cursor, ref)
                if not ok then
                    vim.cmd.tag({ vim.fn.expand("<cword>") })
                end
            end, { buffer = buf, silent = true })
            vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = buf, silent = true })
            vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = buf, silent = true })
            vim.keymap.set({ "n", "v" }, "gj", "j", { buffer = buf, silent = true })
            vim.keymap.set({ "n", "v" }, "gk", "k", { buffer = buf, silent = true })
        end
    end,
}
