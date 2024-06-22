return {
	"catppuccin/nvim",
	enabled = false,
	name = "catppuccin",
	priority = 1000,
	opts = {
		background = {
			light = "latte",
			dark = "macchiato",
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
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
