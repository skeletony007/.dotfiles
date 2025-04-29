return {
    "rebelot/kanagawa.nvim",

    priority = 1000,

    config = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("skeletony007.colors", {}),
            callback = function()
                local palette = {
                    base = "none",
                    panel_bg = "#303030", -- color236
                    panel_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg,
                    panel_bg_muted = "#1c1c1c", -- color233
                    panel_fg_muted = vim.api.nvim_get_hl(0, { name = "Comment" }).fg,
                    panel_bg_focus = "#4e4e4e", -- color239
                }

                local hl_overrides = {
                    Normal = { bg = palette.base },
                    NormalFloat = { link = "Normal" },
                    Visual = { bg = palette.panel_bg },
                    Pmenu = { bg = palette.panel_bg },
                    PmenuSel = { bg = palette.panel_bg_focus },
                    StatusLine = { bg = palette.panel_bg, fg = palette.panel_fg },
                    StatusLineNC = { bg = palette.panel_bg_muted, fg = palette.panel_fg_muted },
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

        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
