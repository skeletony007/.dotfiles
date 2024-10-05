vim.opt_local.swapfile = false
vim.opt_local.backup = false
vim.opt_local.undofile = false

vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = "no"
vim.opt_local.laststatus = 0

vim.keymap.set("n", "q", "<cmd>q!<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>q!<CR>")
vim.keymap.set("n", "<CR>", "<cmd>.w !xargs tmux-sessionizer<CR>:wq<CR>")
