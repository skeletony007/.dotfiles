--- Table of resources for my neovim config (e.g. lsp/formatter/linter setup).
--- Merges any table returned by modules in `skeletony007.personal` with the
--- correct semantic version.
M = {}

--- Merge two lua tables intuitively.
--- Includes list-like vectors and map-like tables.
---@param t table sink table
---@param s table source table
---@return table merged table
M.merge_table_recursive = function(t, s)
    for sk, sv in pairs(s) do
        if type(sk) == "number" then -- list-like-vector
            for _, tv in ipairs(t) do
                if sv == tv then
                    goto continue
                end
            end
            table.insert(t, sv)
        elseif t[sk] and type(t[sk]) == "table" and type(sv) == "table" then
            t[sk] = M.merge_table_recursive(t[sk], sv)
        else
            t[sk] = sv
        end
        ::continue::
    end
    return t
end

local dir_handle = vim.loop.fs_scandir(vim.fn.stdpath("config") .. "/lua/skeletony007/personal")
for name, type in vim.loop.fs_scandir_next, dir_handle do
    if (type == "file" or type == "link") and name:match("%.lua$") and (not name:match("init.lua$")) then
        local modname = "skeletony007.personal." .. name:gsub("%.lua$", "")
        local resource = require(modname)
        if resource.version == "0.0.1" then
            M = M.merge_table_recursive(M, resource)
        end
    end
end

return M
