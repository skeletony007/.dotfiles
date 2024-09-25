vim.keymap.set("n", "q", "<cmd>q!<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>q!<CR>")
vim.keymap.set("n", "<CR>", "<cmd>.w !xargs tmux-sessionizer<CR>:wq<CR>")
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = "no"
vim.opt_local.laststatus = 0
