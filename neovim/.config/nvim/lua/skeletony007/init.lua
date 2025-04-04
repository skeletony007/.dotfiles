require("skeletony007.remap")
require("skeletony007.set")

require("skeletony007.personal_init")
require("skeletony007.lazy_init")

local skeletony007_group = vim.api.nvim_create_augroup("skeletony007Group", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = skeletony007_group,
    callback = function() vim.highlight.on_yank() end,
})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = skeletony007_group,
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
