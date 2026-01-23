vim.g.mapleader = " "

require("skeletony007.remap")
require("skeletony007.set")
require("skeletony007.lazy_init")

local skeletony007_group = vim.api.nvim_create_augroup("skeletony007.group", {})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = skeletony007_group,
    callback = function() vim.cmd("normal! zz") end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = skeletony007_group,
    callback = function() vim.hl.on_yank() end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
