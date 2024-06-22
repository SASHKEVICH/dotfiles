return {
	"stevearc/oil.nvim",
	enabled = true,
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		delete_to_trash = true,
	},
	keys = {
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
	},
}
