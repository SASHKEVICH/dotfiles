return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function(_, _)
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find grep" })
			vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Find files (git)" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

			vim.keymap.set("n", "<leader>sc", ":Telescope colorscheme<CR>", { desc = "Change colorscheme" })

			require("telescope").setup({
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
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		enabled = vim.fn.executable("make") == 1,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
