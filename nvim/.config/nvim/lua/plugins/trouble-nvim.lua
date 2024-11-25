return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"<A-d>",
			"<cmd>silent cc | silent cn<cr>zz",
			desc = "Jump to next issue"
		},
		{
			"<A-s>",
			"<cmd>silent cc | silent cp<cr>zz",
			desc = "Jump to previous issue"
		}
	},
	opts = {
		auto_open = false,
		auto_close = false,
		auto_preview = true,
		auto_jump = false,
		mode = "quickfix",
		severity = vim.diagnostic.severity.ERROR,
		cycle_results = false,
	},
	config = function(_, opts)
		require("trouble").setup(opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
			callback = function(event)
				if event.data.cancelled then
					return
				end

				if event.data.success then
					require("trouble").close()
				elseif not event.data.failedCount or event.data.failedCount > 0 then
					if next(vim.fn.getqflist()) then
						require("trouble").open("quickfix")
					else
						require("trouble").close()
					end

					require("trouble").refresh()
				end
			end,
		})
	end
}
