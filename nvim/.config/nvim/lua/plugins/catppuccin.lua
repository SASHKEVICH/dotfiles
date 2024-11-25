return {
	"catppuccin/nvim",
	enabled = true,
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "macchiato",
		background = {
			light = "latte",
			dark = "macchiato"
		},
		integrations = {
			mason = false,
			neotree = false,
			nvimtree = true,
			alpha = true,
			treesitter = true,
			dap = true,
			dap_ui = true,
			cmp = true,
			telescope = {
				enabled = true,
			},
			fidget = false,
			which_key = false,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
		},
		color_overrides = {
			mocha = { -- custom
				rosewater = "#ffc6be",
				flamingo = "#fb4934",
				pink = "#ff75a0",
				mauve = "#f2594b",
				red = "#f2594b",
				maroon = "#fe8019",
				peach = "#FFAD7D",
				yellow = "#e9b143",
				green = "#b0b846",
				teal = "#8bba7f",
				sky = "#7daea3",
				sapphire = "#689d6a",
				blue = "#80aa9e",
				lavender = "#e2cca9",
				text = "#e2cca9",
				subtext1 = "#e2cca9",
				subtext0 = "#e2cca9",
				overlay2 = "#8C7A58",
				overlay1 = "#735F3F",
				overlay0 = "#806234",
				surface2 = "#665c54",
				surface1 = "#3c3836",
				surface0 = "#32302f",
				base = "#282828",
				mantle = "#1d2021",
				crust = "#1b1b1b",
			},
		}
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
