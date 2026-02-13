return {
    "rebelot/kanagawa.nvim",

    priority = 1000,

    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("skeletony007.colors", {}),
            callback = function()
                local palette = {
                    base = "none",
                    color0 = "#000000",
                    color244 = "#808080",
                }

                local hl_overrides = {
                    Normal = { bg = palette.base },
                    StatusLine = { bg = palette.color244, fg = palette.color0, bold = true },
                    NormalFloat = { bg = palette.base },
                    FloatBorder = { bg = palette.base },
                    FloatTitle = { bg = palette.base },

                    LineNr = { bg = palette.base },
                    SignColumn = { bg = palette.base },
                    DiagnosticSignError = { bg = palette.base },
                    DiagnosticSignWarn = { bg = palette.base },
                    DiagnosticSignInfo = { bg = palette.base },
                    DiagnosticSignHint = { bg = palette.base },
                    DiagnosticSignOk = { bg = palette.base },
                }

                for k, v in pairs(hl_overrides) do
                    vim.api.nvim_set_hl(0, k, vim.tbl_extend("force", vim.api.nvim_get_hl(0, { name = k }) or {}, v))
                end
            end,
        })

        local kanagawa = require("kanagawa")
        kanagawa.setup({
            compile = true,
            overrides = function(colors)
                local theme = colors.theme
                return {
                    Visual = { fg = "none", bg = theme.ui.bg_p2 },

                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                    PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },

                    BlinkCmpMenuBorder = { fg = theme.ui.float.fg_border, bg = "none" },
                    BlinkCmpScrollBarThumb = { bg = theme.ui.bg_p2 },
                    BlinkCmpLabel = { bg = theme.ui.bg_p1 },
                    BlinkCmpSource = { bg = theme.ui.bg_p1, bold = true },
                    BlinkCmpKind = { bg = theme.ui.bg_p1 },
                }
            end,
            theme = "wave",
        })
        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
