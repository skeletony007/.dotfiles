return {
	"chomosuke/typst-preview.nvim",

	ft = "typst",

	version = "1.*",

	config = function()
		require("typst-preview").setup({})
		vim.api.nvim_create_user_command("TypstOpenPdf", function()
			local filepath = vim.api.nvim_buf_get_name(0)
			if filepath:match("%.typ$") then
				os.execute("zathura " .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf")))
			end
		end, {})
		vim.api.nvim_create_user_command("TypstCompile", function()
			local filepath = vim.api.nvim_buf_get_name(0)
			if filepath:match("%.typ$") then
				os.execute("tinymist compile " .. vim.fn.shellescape(filepath))
			end
		end, {})
	end,
}
