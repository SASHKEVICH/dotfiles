return {
	"stevearc/oil.nvim",
	enabled = true,
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		delete_to_trash = true,
		show_hidden = true,
	},
	keys = {
		-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
		vim.keymap.set('n', '-', function()
			require('oil').toggle_float()
		end, { desc = 'Toggle oil in floating window' }),
	},
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = true,
		-- This function defines what is considered a "hidden" file
		is_hidden_file = function(name, _)
			return vim.startswith(name, '.')
		end,
		-- This function defines what will never be shown, even when `show_hidden` is set
		is_always_hidden = function(_, _)
			return false
		end,
		-- Sort file names in a more intuitive order for humans. Is less performant,
		-- so you may want to set to false if you work with large directories.
		natural_order = false,
	}
}
