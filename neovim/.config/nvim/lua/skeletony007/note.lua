local note_root = string.format("%s/notes", os.getenv("PERSONAL"))

local notes_command = function(opts)
    if note_root == nil then
        vim.notify("note root variable does not exist.", vim.log.levels.WARN)
        return nil
    end

    local split_direction = { "below", "left", "above", "right" }
    for i, fname in ipairs(opts.fargs) do
        local buf = vim.fn.bufadd(vim.fs.normalize(string.format("%s/%s.md", note_root, fname)))
        if i == 1 then
            vim.api.nvim_win_set_buf(0, buf)
        else
            vim.api.nvim_open_win(buf, true, { split = split_direction[i % 4] })
        end
    end
end

local notes_complete = function(_, line)
    if note_root == nil then
        vim.notify("note root variable does not exist.", vim.log.levels.WARN)
        return {}
    end

    local l = vim.split(line, "%s+")
    return vim.tbl_filter(
        function(val) return vim.startswith(val, l[#l]) end,
        vim.tbl_map(
            function(item) return item:sub(#note_root + 2, -4) end,
            vim.fs.find(function(name) return name:match(".*%.md$") end, {
                limit = math.huge,
                type = "file",
                path = vim.fs.normalize(note_root),
            })
        )
    )
end

vim.api.nvim_create_user_command("Note", notes_command, {
    nargs = "*",
    complete = notes_complete,
})
