return {
	{
		"nvim-telescope/telescope.nvim",
		-- pull a specific version of the plugin
		tag = "0.1.8",
		event = "VeryLazy",
		lazy = true,
		dependencies = {
			{
				-- general purpose plugin used to build user interfaces in neovim plugins
				"nvim-lua/plenary.nvim",
			},
			{
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
			},
		},
		config = function()
			-- get access to telescopes built in functions
			local builtin = require("telescope.builtin")

			-- set a vim motion to <Space> + f + f to search for files by their names
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			-- set a vim motion to <Space> + f + g to search for files based on the text inside of them
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			-- set a vim motion to <Space> + f + s to serach for symbols in the current project
			vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "[F]ind [S]ymbols" })
			-- set a vim motion to <Space> + f + d to search for Code Diagnostics in the current project
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
			-- set a vim motion to <Space> + f + r to resume the previous search
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]inder [R]esume" })
			-- set a vim motion to <Space> + f + . to search for Recent Files
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
			-- set a vim motion to <Space> + f + b to search Open Buffers
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind Existing [B]uffers" })
			vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorscheme" })
			vim.keymap.set("n", "<leader>fw", function()
				require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
			end, { desc = "[F]ind [W]ord" })
			-- Neoclip
			vim.keymap.set(
				"n",
				"<leader>fp",
				"<cmd>Telescope neoclip<CR>",
				{ desc = "Paste from clipboard", silent = true }
			)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			-- get access to telescopes navigation functions
			local actions = require("telescope.actions")
			local icons = require("config.icons")

			require("telescope").setup({
				-- use ui-select dropdown as our ui
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
				defaults = {
					prompt_prefix = icons.ui.Telescope .. " ",
					selection_caret = icons.ui.Forward .. " ",
					entry_prefix = "   ",
					initial_mode = "normal",
					selection_strategy = "reset",
					path_display = { "smart" },
					color_devicons = true,
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
				},
				-- set keymappings to navigate through items in the telescope io
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<c-w>"] = actions.close,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
					},
				},
				pickers = {
					live_grep = {
						theme = "dropdown",
					},

					grep_string = {
						theme = "dropdown",
					},

					find_files = {
						theme = "dropdown",
						initial_mode = "insert",
						previewer = true,
					},

					buffers = {
						theme = "dropdown",
						previewer = true,
						initial_mode = "normal",
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["dd"] = actions.delete_buffer,
							},
						},
					},

					planets = {
						show_pluto = true,
						show_moon = true,
					},

					colorscheme = {
						enable_preview = true,
					},

					lsp_references = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_definitions = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_declarations = {
						theme = "dropdown",
						initial_mode = "normal",
					},

					lsp_implementations = {
						theme = "dropdown",
						initial_mode = "normal",
					},
				},
			})
			-- load the ui-select extension
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")
		end,
	},
}
