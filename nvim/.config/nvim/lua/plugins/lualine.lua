return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		globalstatus = true,
		options = {
			theme = "catppuccin",
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		extensions = {
			"lazy",
			"fzf",
			"mason",
			"nvim-tree",
			"neo-tree",
			"oil",
			"nvim-dap-ui",
			"toggleterm",
			"trouble"
		},
		sections = {
			lualine_a = {
				{
					"mode",
					right_padding = 2
				}
			},
			lualine_b = {
				{
					'branch',
					fmt = function(branch_name)
						local max_branch_name_length = 30
						local branch_name_length = #branch_name
						if branch_name_length <= max_branch_name_length then
							return branch_name
						else
							local cutted_branch_name = string.sub(branch_name, 1, max_branch_name_length + 1)
							return cutted_branch_name .. '...'
						end
					end,
				}
			},
			lualine_c = {
				-- "%=", --[[ add your center compoentnts here in place of this comment ]]
				{
					"filename",
					path = 0
				}
			},
			lualine_x = {
				{ "'󰙨 ' .. vim.g.xcodebuild_test_plan" },
				{
					"vim.g.xcodebuild_platform == 'macOS' and '  macOS' or ' ' .. vim.g.xcodebuild_device_name",
				},
				{ "' ' .. vim.g.xcodebuild_scheme" },
			},
			lualine_y = {
				{ "filetype", icon_only = true },
			},
			lualine_z = {
				{ "location", left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
