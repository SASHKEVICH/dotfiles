return {
	{
		"numToStr/Comment.nvim",
		lazy = true,
		enabled = true,
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
		config = function()
			vim.g.skip_ts_context_commentstring_module = true
			vim.opt.updatetime = 100

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("FixSwiftCommentString", { clear = true }),
				callback = function(ev)
					vim.bo[ev.buf].commentstring = "// %s"
				end,
				pattern = { "swift" },
			})
		end,
	},
}
