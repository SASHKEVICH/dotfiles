return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		"catppuccin/nvim",
	},
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
		{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
		{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
		{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
		{ "<leader>bn", ":enew<CR>",                               desc = "Create new buffer" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				-- stylua: ignore
				close_command = function(n) require("mini.bufremove").delete(n, false) end,
				-- stylua: ignore
				right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
