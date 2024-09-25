vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "]q", function()
    if not pcall(vim.cmd.cnext) then
        vim.cmd.cfirst()
    end
    vim.cmd("normal! zz")
end)
vim.keymap.set("n", "[q", function()
    if not pcall(vim.cmd.cprevious) then
        vim.cmd.clast()
    end
    vim.cmd("normal! zz")
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", function()
    local file_path = vim.fn.expand("%:p")

    if vim.fn.executable(file_path) == 1 then
        vim.cmd(string.format("!chmod $((0666 - $(umask))) %s", file_path))
    else
        vim.cmd(string.format("!chmod +x %s", file_path))
    end
end, { silent = true })
