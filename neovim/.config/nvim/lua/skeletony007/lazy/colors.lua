local default_color = "kanagawa"

function Color(color)
    color = color or default_color
    vim.cmd.colorscheme(color)

    local palette = {
        base = "none",
        panel_bg = vim.api.nvim_get_hl(0, { name = "ColorColumn" }).bg,
        panel_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg,
    }

    local hl_overrides = {
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

    for name, val in pairs(hl_overrides) do
        vim.api.nvim_set_hl(0, name, vim.tbl_extend("force", vim.api.nvim_get_hl(0, { name = name }) or {}, val))
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
        -- latest version without fancy bracket highlighting
        version = "v1.2.2",

        pin = true,

        name = "rose-pine",

        main = "rose-pine",

        opts = {
            variant = "moon",
            disable_background = true,
        },
    },
}

for i, plugin in ipairs(plugins) do
    local is_default_color = plugin.name == default_color
    plugins[i] = vim.tbl_extend("keep", plugin, {
        priority = 1000,
        lazy = not is_default_color,
        pin = not is_default_color,
        config = function() Color(plugin.name) end,
    })
end

return plugins
