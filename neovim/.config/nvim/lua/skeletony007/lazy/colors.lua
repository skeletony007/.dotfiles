local default_color = "kanagawa"

function Color(color)
    color = color or default_color
    vim.cmd.colorscheme(color)

    local palette = {
        base = "none",
        panel_bg = vim.api.nvim_get_hl(0, { name = "ColorColumn" }).bg,
        panel_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg,
    }

    local overrides = {
        Normal = { bg = palette.base },
        NormalFloat = { link = "Normal" },
        StatusLine = { bg = palette.panel_bg, fg = palette.panel_fg },
        LineNr = { bg = palette.base },
        SignColumn = { bg = palette.base },
        DiagnosticSignError = { bg = palette.base },
        DiagnosticSignWarn = { bg = palette.base },
        DiagnosticSignInfo = { bg = palette.base },
        DiagnosticSignHint = { bg = palette.base },
        DiagnosticSignOk = { bg = palette.base },
    }

    local acc
    for name, val in pairs(overrides) do
        acc = vim.api.nvim_get_hl(0, { name = name }) or {}
        for k, v in pairs(val) do
            acc[k] = v
        end
        vim.api.nvim_set_hl(0, name, acc)
    end
end

local plugins = {
    {
        "folke/tokyonight.nvim",

        name = "tokyonight",

        main = "tokyonight",

        opts = {
            style = "moon",
            transparent = true,
        },
    },
    {
        "catppuccin/nvim",

        name = "catppuccin",

        main = "catppuccin",

        opts = {
            flavour = "frappe",
            transparent_background = true,
        },
    },
    {
        "rebelot/kanagawa.nvim",

        name = "kanagawa",

        main = "kanagawa",

        opts = {
            theme = "wave",
            transparent = true,
        },
    },
    {
        "rose-pine/neovim",

        version = "v1.2.2", -- latest version without fancy bracket highlighting

        pin = true,

        name = "rose-pine",

        main = "rose-pine",

        opts = {
            variant = "moon",
            disable_background = true,
        },
    },
}

local new_plugins = {}
for i, plugin in ipairs(plugins) do
    local plugin_template = {
        priority = plugin.priority or 1000,
        lazy = plugin.name ~= default_color,
        pin = plugin.name ~= default_color,
        config = function() Color(plugin.name) end,
    }

    for k, v in pairs(plugin_template) do
        if plugin[k] == nil then
            -- NOTE: ignore warning here
            plugin[k] = v
        end
    end

    table.insert(new_plugins, i, plugin)
end

return new_plugins
