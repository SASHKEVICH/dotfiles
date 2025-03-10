return {
	{
		"williamboman/mason.nvim",
		-- lazy = true,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile", "LspAttach" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		keys = {
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" }),
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" }),
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" }),
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to reference" }),
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" }),
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" }),
		},
		config = function()
			local lspconfig = require("lspconfig")
			local opts = { noremap = true, silent = true }

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)

			lspconfig.sourcekit.setup({
				root_dir = lspconfig.util.root_pattern(
					'.git',
					'Package.swift'
				),
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						}
					}
				},
				filetypes = { 'swift', 'c', 'cpp', 'objective-c', 'objc', 'objective-cpp' },
				on_init = function(client, _)
					if client.server_capabilities then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
				get_language_id = function(_, ftype)
					if ftype == "objc" then
						return "objective-c"
					elseif ftype == "objcpp" then
						return "objective-cpp"
					end
					return ftype
				end,
			})

			lspconfig.lua_ls.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.pyright.setup({})
		end,
	},
}
