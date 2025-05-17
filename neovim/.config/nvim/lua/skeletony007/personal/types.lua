--- @class skeletony007.presonal.Resource
--- @field version? "0.0.1"
--- @field nvim_treesitter? skeletony007.personal.NvimTreesitterConfig
--- @field blink_cmp? skeletony007.personal.BlinkCmpConfig
--- @field mason_lspconfig? skeletony007.personal.MasonLspconfigConfig
--- @field mason_tool_installer? skeletony007.personal.MasonToolInstallerConfig
--- @field formatter_init? table<string, fun(): boolean>
--- @field formatters_by_ft? table<string, string[]>
--- @field linter_init? table<string, fun(): boolean>
--- @field linters_by_ft? table<string, string[]>
--- @field ls? skeletony007.personal.LSConfig
--- @field private_mode? skeletony007.personal.PrivateModeConfig
--- @field merge_table_recursive? fun(sink: table, source: table): table

--- @class skeletony007.personal.NvimTreesitterConfig
--- @field setup? table

--- @class skeletony007.personal.BlinkCmpConfig
--- @field setup? table

--- @class skeletony007.personal.MasonLspconfigConfig
--- @field setup? table

--- @class skeletony007.personal.MasonToolInstallerConfig
--- @field setup? table

--- @class skeletony007.personal.LSConfig
--- @field setup? table

--- @class skeletony007.personal.PrivateModeConfig
--- @field setup? table
