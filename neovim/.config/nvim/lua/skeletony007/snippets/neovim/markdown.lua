return {
    s(
        { trig = "---", desc = "yaml frontmatter" },
        fmt(
            [[
            ---
            title: {}
            date: {}
            tags: [{}]
            ---
            {}
            ]],
            {
                i(
                    1,
                    (function()
                        local file_name = vim.fn.expand("%:t:r")
                        if file_name == "" then
                            return "title"
                        else
                            return file_name
                        end
                    end)()
                ),
                f(function() return os.date("%Y-%m-%d %H:%M:%S %z") end, {}),
                f(function()
                    local tag_freq = {}

                    local result = vim.lsp.buf_request_sync(0, "workspace/symbol", { query = "Tag:" })

                    if result then
                        for _, server_response in pairs(result) do
                            if server_response.result then
                                for _, item in ipairs(server_response.result) do
                                    if item.kind == 15 and item.location.uri == vim.uri_from_bufnr(0) then
                                        local tag_name = item.name:match("Tag: (.+)")
                                        if tag_name then
                                            tag_freq[tag_name] = (tag_freq[tag_name] or 0) + 1
                                        end
                                    end
                                end
                            end
                        end
                    end

                    local tags = {}
                    local top_tags = {}
                    for tag, freq in pairs(tag_freq) do
                        table.insert(tags, { name = tag, frequency = freq })
                    end
                    table.sort(tags, function(a, b) return a.frequency > b.frequency end)
                    for i = 1, math.min(6, #tags) do
                        table.insert(top_tags, tags[i].name)
                    end

                    return table.concat(top_tags, ", ")
                end, {}),
                i(0),
            }
        )
    ),
    s(
        { trig = "```", desc = "Markdown code block" },
        fmt(
            [[
            ```{}
            {}
            ```
            {}
            ]],
            {
                i(1),
                i(2),
                i(0),
            }
        )
    ),
}
