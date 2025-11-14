local filetypes = { "sql", "mysql" }
return {
	"kristijanhusak/vim-dadbod-completion",

	dependencies = {
		"tpope/vim-dadbod",
		"saghen/blink.cmp",
	},

	cmd = "DB",

	ft = filetypes,

	setup = function()
		local cmp = require("blink.cmp")
		cmp.add_provider("dadbod", { name = "Dadbod", module = "vim_dadbod_completion.blink" })
		local dadbod_group = vim.api.nvim_create_augroup("skeletony007.dadbod", { clear = false })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,
			group = dadbod_group,
			callback = function()
                print("callback")
				vim.keymap.set("i", "<C-x><C-o>", function()
					cmp.show({ providers = { "dadbod", "lsp" } })
				end, { buffer = true })
			end,
		})
	end,
}
