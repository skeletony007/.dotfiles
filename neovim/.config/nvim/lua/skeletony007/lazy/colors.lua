function Color(color)
    vim.cmd.colorscheme(color or "default")

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

    for k, v in pairs(hl_overrides) do
        vim.api.nvim_set_hl(0, k, vim.tbl_extend("force", vim.api.nvim_get_hl(0, { name = k }) or {}, v))
    end
end

return {
    "rebelot/kanagawa.nvim",

    priority = 1000,

    config = function() Color("kanagawa-wave") end,
}
