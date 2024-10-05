return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	lazy = true,
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	config = function()
		require("ibl").setup()
	end,
}
