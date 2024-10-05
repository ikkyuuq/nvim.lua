return {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
	config = function()
		require("colorizer").setup({
			"css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			html = {
				mode = "foreground",
			},
			css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
			html = { names = false }, -- Disable parsing "names" like Blue or Gray
		})
	end,
}
