return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		opts = {
			defaults = {
				prompt_prefix = "❯ ",
				selection_caret = "❯ ",
				hidden = true,
				file_ignore_patterns = {
					"./node_modules/.*",
					"yarn.lock",
					"package-lock.json",
					"lazy-lock.json",
					"init.sql",
					"./target/.*",
					".git/.*",
					"./Build",
					"./.nvim/*",
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				find_files = {
					hidden = true,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
				},
			},
			preview = {
				treesitter = true
			}
		},
		keys = {
			{
				"<leader>sc",
				function()
					local builtin = require("telescope.builtin")
					builtin:colorscheme()
				end,
				desc = "Change colorscheme"
			},
			{
				"<leader>ff",
				function()
					local builtin = require("telescope.builtin")
					builtin:find_files()
				end,
				desc = "Find files"
			},
			{
				"<leader>fg",
				function()
					local builtin = require("telescope.builtin")
					builtin:live_grep()
				end,
				desc = "Find grep"
			},
			{
				"<leader>fG",
				function()
					local builtin = require("telescope.builtin")
					builtin:git_files()
				end,
				desc = "Find Git Files"
			},
			{
				"<leader>fb",
				function()
					local builtin = require("telescope.builtin")
					builtin:buffers()
				end,
				desc = "Find Buffers"
			},
			{
				"<leader>fh",
				function()
					local builtin = require("telescope.builtin")
					builtin:search_history()
				end,
				desc = "Open Search History"
			},
			{
				"<leader>fr",
				function()
					local builtin = require("telescope.builtin")
					builtin:oldfiles()
				end,
				desc = "Recent Files"
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
		opts = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
		enabled = vim.fn.executable("make") == 1,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
