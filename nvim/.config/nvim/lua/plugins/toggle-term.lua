return {
	enabled = true,
	"akinsho/toggleterm.nvim",
	lazy = true,
	cmd = { "ToggleTerm" },
	version = "*",
	keys = {
		{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Open a terminal" },
		{
			"<leader>lg",
			function()
				local Terminal = require('toggleterm.terminal').Terminal
				local lazygit  = Terminal:new({ cmd = "lazygit" })

				lazygit:toggle()
			end,
			desc = "Open lazygit"
		}
	},
	opts = {
		direction = "float",
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end
}
