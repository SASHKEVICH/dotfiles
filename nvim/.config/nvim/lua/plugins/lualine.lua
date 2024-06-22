-- stylua: ignore
local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#303030',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		globalstatus = true,
		options = {
			theme = "gruvbox",
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		extensions = {
			"lazy",
			"mason",
			"nvim-tree",
			"neo-tree",
			"oil",
			"nvim-dap-ui",
		},
		sections = {
			lualine_a = { { "mode", right_padding = 2 } },
			lualine_b = { "branch" },
			lualine_c = {
				"%=", --[[ add your center compoentnts here in place of this comment ]]
			},
			lualine_x = {
				{ "diff" },
				{ "'󰙨 ' .. vim.g.xcodebuild_test_plan" },
				{
					"vim.g.xcodebuild_platform == 'macOS' and '  macOS' or ' ' .. vim.g.xcodebuild_device_name",
				},
				{ "' ' .. vim.g.xcodebuild_os" },
				{ "encoding" },
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
		tabline = {},
	},
}
