return {
	{
		"echasnovski/mini.surround",
		version = "*",
		opts = {
			mappings = {
				add = "ma",
				delete = "md",
				find = "mf",
				find_left = "mF",
				highllight = "mh",
				replace = "mr",
				update_n_lines = "mn",

				suffix_last = "l",
				suffix_next = "n",
			},
		},
	},
	{
		"echasnovski/mini.ai",
		version = "*",
		confin = function()
			require("mini.ai").setup()
		end,
	},
	-- {
	-- 	"echasnovski/mini.animate",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.animate").setup()
	-- 	end,
	-- },
	-- {
	-- 	"echasnovski/mini.hipatterns",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("mini.hipatterns")
	-- 	end,
	-- },
}
