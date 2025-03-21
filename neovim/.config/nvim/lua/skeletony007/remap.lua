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
vim.keymap.set("n", "<leader>qq", function()
    if vim.fn.getqflist({ winid = 0 }).winid == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", function()
    local file_path = vim.fn.expand("%:p")
    local perm = (vim.fn.executable(file_path) == 1 and "-" or "+") .. "x"
    vim.system({ "chmod", perm, file_path }, { text = true }, function(obj)
        if obj.code == 0 then
            print(string.format("Permissions changed to %s.", perm))
        else
            print(string.format("Failed to change permissions: %s", obj.stderr))
        end
    end)
end)
