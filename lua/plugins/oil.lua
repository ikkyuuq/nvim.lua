return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup({
			keymaps = {
				["<C-h>"] = false,
				["<A-h"] = "actions.select_split",
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "\\", require("oil").toggle_float, { silent = true, desc = "Open FloatingOil" })
	end,
}
