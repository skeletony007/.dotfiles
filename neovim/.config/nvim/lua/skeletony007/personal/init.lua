--- Table of resources for my neovim config (e.g. lsp/formatter/linter setup).
--- Merges any table returned by modules in `skeletony007.personal` with the
--- correct semantic version.
--- @type skeletony007.personal.Resource
local M = {}

--- Merge two lua tables intuitively.
--- Includes list-like vectors and map-like tables.
---@param t table sink table
---@param s table source table
---@return table merged table
function M.merge_table_recursive(t, s)
    for sk, sv in pairs(s) do
        if type(sk) == "number" then -- list-like-vector
            for _, tv in ipairs(t) do
                if sv == tv then
                    goto continue
                end
            end
            table.insert(t, sv)
        elseif t[sk] and type(t[sk]) == "table" and type(sv) == "table" then
            M.merge_table_recursive(t[sk], sv)
        else
            t[sk] = sv
        end
        ::continue::
    end
    return t
end

local dir_handle = vim.loop.fs_scandir(vim.fn.stdpath("config") .. "/lua/skeletony007/personal")
for name, type in vim.loop.fs_scandir_next, dir_handle do
    if name ~= "init.lua" and name ~= "types.lua" and (type == "file" or type == "link") and name:match("%.lua$") then
        local modname = "skeletony007.personal." .. name:gsub("%.lua$", "")
        --- @type skeletony007.personal.Resource
        local resource
        local ok
        ok, resource = pcall(require,modname)
        if not ok then
            error(("Failed to load module %q"):format(modname))
            goto continue
        end
        if resource.version == "0.0.1" then
            M.merge_table_recursive(M, resource)
        end
    end
    ::continue::
end

return M
