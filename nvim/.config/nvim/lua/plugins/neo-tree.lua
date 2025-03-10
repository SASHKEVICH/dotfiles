return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	event = "VeryLazy",
	enabled = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>ee",
			"<cmd>Neotree toggle left<CR>",
			desc = "Open explorer"
		},
		{
			"<leader>ef",
			"<cmd>Neotree toggle reveal left<CR>",
			desc = "Open current file in explorer"
		}
	},
	opts = {
		close_if_last_window = true,
		enable_git_status = true,
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".git",
					".nvim",
					"Build",
					"buildServer.json",
				},
				hide_by_pattern = {
					"*.xcodeproj",
					"*.xcworkspace",
				},
				never_show = {
					".DS_Store",
				},
			},
		},
		source_selector = {
			winbar = true,
			sources = {
				{ source = "filesystem" },
				{ source = "git_status" },
			},
		},
		git_status = {
			symbols = {
				-- Change type
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "U",
				staged = "",
				conflict = "",
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
	end,
}
