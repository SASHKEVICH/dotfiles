return {
	"uga-rosa/ccc.nvim",
	enabled = true,
	lazy = true,
	opts = {
		highlighter = {
			auto_enable = true,
			lsp = true,
		},
	},
	config = function(_, opts)
		vim.opt.termguicolors = true
		require("ccc").setup(opts)
	end
}
