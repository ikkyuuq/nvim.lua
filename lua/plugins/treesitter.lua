return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "windwp/nvim-ts-autotag" },
	lazy = true,
	build = ":TSUpdate",
	config = function()
		local ts_config = require("nvim-treesitter.configs")

		ts_config.setup({
			auto_install = true,
			ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"tsx",
				"markdown",
				"markdown_inline",
				"gitignore",
			},
			highlight = { enable = true },
			indent = { enable = true },
			autotag = {
				enable = true,
			},
		})
	end,
}
