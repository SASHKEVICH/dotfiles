return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		keys = {
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" }),
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" }),
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" }),
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" }),
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" }),
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()
			local opts = { noremap = true, silent = true }

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			lspconfig.sourcekit.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = {
					"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
				},
			})

			lspconfig.lua_ls.setup({})
			lspconfig.yamlls.setup({})
		end,
	},
}
