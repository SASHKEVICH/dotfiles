return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	keys = {
		{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Open a terminal" },
	},
	opts = {
		direction = "float",
	},
}
